import { 
  MAX_PATH_LENGTH,
  MAX_FILENAME_LENGTH,
  VALID_FILENAME_REGEX
} from '../constants';

export function validateFolderName(name: string): boolean {
  if (!name || name.length > MAX_FILENAME_LENGTH) {
    return false;
  }
  
  // Prevent empty names, dots/slashes, and invalid characters
  if (name === '.' || name === '..' || name.includes('/') || name.includes('\\')) {
    return false;
  }

  return VALID_FILENAME_REGEX.test(name);
}

export function cleanPath(path: string): string {
  const cleaned = path.trim()
    .replace(/^\/+|\/+$/g, '')    // Remove leading/trailing slashes
    .replace(/\/+/g, '/')         // Normalize multiple slashes
    .replace(/[^\w\-./\s]/g, '_'); // Sanitize remaining characters

  // Ensure path doesn't exceed max length
  return cleaned.slice(0, MAX_PATH_LENGTH);
}

export function validateFolderPath(path: string): boolean {
  if (!path || path.length > MAX_PATH_LENGTH) {
    return false;
  }

  const cleanedPath = cleanPath(path);
  
  // Path must not be empty
  if (!cleanedPath) {
    return false;
  }

  // Prevent path traversal attempts
  if (cleanedPath.includes('..')) {
    return false;
  }

  // Each path segment must be valid
  return cleanedPath.split('/').every(part => {
    return part && validateFolderName(part);
  });
}

export function validateFilePath(path: string): boolean {
  if (!validateFolderPath(path)) {
    return false;
  }

  // Additional file-specific validations
  const filename = path.split('/').pop();
  if (!filename || !validateFolderName(filename)) {
    return false;
  }

  return true;
}

export function getParentPath(path: string): string {
  const parts = path.split('/');
  return parts.slice(0, -1).join('/');
}

export function getFileName(path: string): string {
  return path.split('/').pop() || '';
}