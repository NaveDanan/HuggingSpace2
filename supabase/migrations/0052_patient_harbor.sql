-- Drop existing policies
DO $$ 
BEGIN
  DROP POLICY IF EXISTS "Model files are readable by everyone" ON storage.objects;
  DROP POLICY IF EXISTS "Users can manage their model files" ON storage.objects;
EXCEPTION
  WHEN OTHERS THEN NULL;
END $$;

-- Create function to validate storage path structure
CREATE OR REPLACE FUNCTION storage.validate_model_file_path(path text)
RETURNS boolean AS $$
DECLARE
  path_parts text[];
  filename text;
BEGIN
  -- Split path into parts
  path_parts := string_to_array(path, '/');
  
  -- Validate path has at least 4 parts: userId/models/modelId/filename
  IF array_length(path_parts, 1) < 4 THEN
    RETURN false;
  END IF;

  -- Validate second part is 'models'
  IF path_parts[2] != 'models' THEN
    RETURN false;
  END IF;

  -- Validate modelId is a UUID
  IF path_parts[3] !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' THEN
    RETURN false;
  END IF;

  -- Get filename (last part)
  filename := path_parts[array_length(path_parts, 1)];

  -- Validate filename format
  IF filename !~ '^[\w\-. ]+$' THEN
    RETURN false;
  END IF;

  RETURN true;
END;
$$ LANGUAGE plpgsql;

-- Create simplified policies with better access control
CREATE POLICY "Model files are readable by everyone"
  ON storage.objects FOR SELECT
  USING (
    bucket_id = 'model-files' AND
    storage.validate_model_file_path(name) AND
    EXISTS (
      SELECT 1 FROM models m
      WHERE m.id::text = split_part(name, '/', 3)
      AND (NOT m.is_private OR m.author_id = auth.uid())
    )
  );

CREATE POLICY "Users can manage their model files"
  ON storage.objects
  FOR ALL
  TO authenticated
  USING (
    bucket_id = 'model-files' AND
    storage.validate_model_file_path(name) AND
    split_part(name, '/', 1) = auth.uid()::text AND
    EXISTS (
      SELECT 1 FROM models m
      WHERE m.id::text = split_part(name, '/', 3)
      AND m.author_id = auth.uid()
    )
  );

-- Create index for better performance
CREATE INDEX IF NOT EXISTS idx_storage_model_files
  ON storage.objects (bucket_id, name)
  WHERE bucket_id = 'model-files';