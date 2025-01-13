import { supabase } from '../supabase';
import { STORAGE_BUCKETS } from '../constants';
import { validateFilePath } from '../validation/fileValidation';
import { buildStoragePath } from '../utils/paths';

import { API_BASE_URL } from '../constants';
import { DATABASE_TYPE } from '../constants';
export async function createFile(fileData: any) {
  const response = await fetch(`${API_BASE_URL}/files/create`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(DATABASE_TYPE === 'postgresql' && {
        Authorization: `Bearer ${localStorage.getItem('authToken')}`,
      }),
    },
    body: JSON.stringify(fileData),
  });

  if (!response.ok) {
    throw new Error(`Error creating file: ${response.statusText}`);
  }
  return response.json();
}


export async function readFile(userId: string, modelId: string, path: string): Promise<string> {
  if (!userId || !modelId) {
    throw new Error('Missing required parameters');
  }
  if (!path) {
    throw new Error('File path is required');
  }

  if (!validateFilePath(path)) {
    throw new Error('Invalid file path');
  }

  const storagePath = buildStoragePath(userId, modelId, path);
  try {
    const { data, error } = await supabase.storage
      .from(STORAGE_BUCKETS.MODEL_FILES)
      .download(storagePath);

    if (error) {
      if (error.statusCode === '404' || error.message?.includes('not found')) {
        throw new Error(`File not found: ${path}`);
      }
      throw error;
    }
    if (!data) {
      throw new Error('Failed to read file content');
    }
    return await data.text();
  } catch (err) {
    // Handle storage errors gracefully
    if (err.statusCode === '404' || err.message?.includes('not found')) {
      throw new Error(`File not found: ${path}`);
    }
    throw new Error(`Failed to read file: ${path}`);
  }
}

export async function uploadFile(
  userId: string,
  modelId: string,
  filePath: string,
  fileContent: string
) {
  const storagePath = buildStoragePath(userId, modelId, filePath);
  
  // Convert string content to Blob
  const blob = new Blob([fileContent], { type: 'text/plain' });

  const { error } = await supabase.storage
    .from(STORAGE_BUCKETS.MODEL_FILES)
    .upload(storagePath, blob, {
      upsert: true,
      contentType: 'text/plain',
      cacheControl: '3600'
    });

  if (error) {
    throw new Error(`Failed to upload file: ${error.message}`);
  }
}

export async function writeFile(
  userId: string, 
  modelId: string, 
  path: string, 
  content: string | Blob
): Promise<void> {
  if (!validateFilePath(path)) {
    throw new Error('Invalid file path');
  }

  const storagePath = buildStoragePath(userId, modelId, path);
  const fileContent = typeof content === 'string' 
    ? new Blob([content], { type: 'text/plain' })
    : content;

  const { error } = await supabase.storage
    .from(STORAGE_BUCKETS.MODEL_FILES)
    .upload(storagePath, fileContent, {
      upsert: true,
      contentType: typeof content === 'string' ? 'text/plain' : content.type,
      cacheControl: '3600'
    });

  if (error) throw error;
}

export async function deleteFile(
  userId: string,
  modelId: string,
  path: string
): Promise<void> {
  if (!validateFilePath(path)) {
    throw new Error('Invalid file path');
  }

  const storagePath = buildStoragePath(userId, modelId, path);
  const { error } = await supabase.storage
    .from(STORAGE_BUCKETS.MODEL_FILES)
    .remove([storagePath]);

  if (error) throw error;
}

export async function listFiles(
  userId: string,
  modelId: string,
  prefix: string = ''
): Promise<string[]> {
  try {
    const storagePath = buildStoragePath(userId, modelId, prefix);

    // Clean and validate prefix
    const cleanPrefix = prefix.replace(/^\/+|\/+$/g, '');
    if (cleanPrefix && !validateFolderPath(cleanPrefix)) {
      return [];
    }

    const { data, error } = await supabase.storage
      .from(STORAGE_BUCKETS.MODEL_FILES)
      .list(storagePath, {
        limit: 100,
        sortBy: { column: 'name', order: 'asc' }
      });

    // Return empty array for missing directories
    if (error?.statusCode === '404' || error?.message?.includes('not found')) {
      return [];
    }
    if (error) throw error;

    // Log the raw items for debugging
    console.log('=== listFiles DEBUG ===');
    console.log(`Requested path: "${storagePath}" (cleanPrefix: "${cleanPrefix}")`);
    (data || []).forEach(item => {
      console.log(
        `Item name: "${item.name}" | metadata.isFolder:`,
        item.metadata?.isFolder,
        `| Ends with slash?`,
        item.name.endsWith('/')
      );
    });

    const files = (data || []).map(item => {
      const itemPath = cleanPrefix 
        ? `${cleanPrefix}/${item.name}`.replace(/^\/+/, '')
        : item.name;

      // Additional console log per item
      console.log(
        `Building file record => itemPath: "${itemPath}", isFolder (metadata):`,
        item.metadata?.isFolder
      );

      return {
        path: itemPath,
        isFolder: item.metadata?.isFolder || false
      };
    });

    return files
      .filter(f => !f.isFolder)
      .map(f => f.path);

  } catch (err) {
    if (err.statusCode === '404' || err.message?.includes('not found')) {
      return [];
    }
    throw err;
  }
}