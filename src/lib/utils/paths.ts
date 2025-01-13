import { MAX_PATH_LENGTH } from '../constants';

export function buildStoragePath(userId: string, modelId: string, path: string = ''): string {
  const cleanPath = path.trim()
    .replace(/^\/+|\/+$/g, '')  // Remove leading/trailing slashes
    .replace(/\/+/g, '/');      // Normalize slashes

  const storagePath = `${userId}/models/${modelId}/${cleanPath}`;
  return storagePath.slice(0, MAX_PATH_LENGTH);
}

export function getParentPath(path: string): string {
  const parts = path.split('/');
  return parts.slice(0, -1).join('/');
}

export function getFileName(path: string): string {
  return path.split('/').pop() || '';
}

export function joinPaths(...paths: string[]): string {
  return paths
    .map(p => p.trim().replace(/^\/+|\/+$/g, ''))
    .filter(Boolean)
    .join('/');
}