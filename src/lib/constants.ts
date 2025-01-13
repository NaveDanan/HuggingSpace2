// File size limits
export const MAX_FILE_SIZE = 500 * 1024 * 1024; // 500MB
export const MAX_BATCH_SIZE = 10 * 1024 * 1024; // 10MB

// Path length limits
export const MAX_PATH_LENGTH = 255;
export const MAX_FILENAME_LENGTH = 100;

// Storage buckets
export const STORAGE_BUCKETS = {
  MODEL_FILES: 'model-files',
  AVATARS: 'avatars'
} as const;

// Validation
export const VALID_FILENAME_REGEX = /^[\w\-. ]+$/;

export const MAX_LENGTHS = {
  PATH: 255,
  FILENAME: 100,
  USERNAME: 50,
  DISPLAY_NAME: 100,
  BIO: 500,
  URL: 255,
  INTERESTS: 10,
  COMMIT_MESSAGE: 1000
};

export const DATABASE_TYPE = import.meta.env.VITE_DATABASE;

export const API_BASE_URL = DATABASE_TYPE === 'postgresql'
  ? `http://${import.meta.env.VITE_PG_HOST}:${import.meta.env.VITE_BACKEND_PORT}`
  : import.meta.env.VITE_SUPABASE_URL;

export const IS_SUPABASE = DATABASE_TYPE !== 'postgresql';