import { supabase } from '../supabase';
import { validateFilePath } from '../validation/fileValidation';

export async function createCommitForFiles(
  modelId: string,
  userId: string,
  message: string,
  files: string[]
): Promise<void> {
  // Validate inputs
  if (!modelId || !userId || !message || !files.length) {
    throw new Error('Missing required parameters');
  }

  // Validate message length
  if (message.length < 3 || message.length > 1000) {
    throw new Error('Commit message must be between 3 and 1000 characters');
  }

  // Validate file paths
  for (const file of files) {
    if (!validateFilePath(file)) {
      throw new Error(`Invalid file path: ${file}`);
    }
  }

  const { error } = await supabase
    .from('model_commits')
    .insert({
      model_id: modelId,
      author_id: userId,
      message,
      files
    });

  if (error) throw error;
}