import { MAX_LENGTHS } from '../constants';

// File validation
export function validateFilePath(path: string): boolean {
  if (!path || path.length > MAX_LENGTHS.PATH) {
    return false;
  }
  return path.split('/').every(part => validateFileName(part));
}

export function validateFileName(name: string): boolean {
  if (!name || name.length > MAX_LENGTHS.FILENAME) {
    return false;
  }
  return /^[\w\-. ]+$/.test(name);
}

// Profile validation
export function validateUsername(username: string): boolean {
  if (!username || username.length > MAX_LENGTHS.USERNAME) {
    return false;
  }
  return /^[a-zA-Z0-9_]+$/.test(username);
}

export function validateDisplayName(name: string | null): boolean {
  if (!name) return true;
  return name.length <= MAX_LENGTHS.DISPLAY_NAME;
}

export function validateUrl(url: string | null): boolean {
  if (!url) return true;
  if (url.length > MAX_LENGTHS.URL) return false;
  try {
    new URL(url);
    return true;
  } catch {
    return false;
  }
}

// Content validation
export function validateContentLength(content: string, maxLength: number): boolean {
  return content.length <= maxLength;
}

export function validateArrayLength<T>(arr: T[], maxLength: number): boolean {
  return Array.isArray(arr) && arr.length <= maxLength;
}