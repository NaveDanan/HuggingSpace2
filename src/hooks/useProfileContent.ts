import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { withRetry } from '../lib/supabase';
import { handleSupabaseError } from '../utils/error';
import type { Profile } from '../types/profile';

export function useProfileContent(profileId: string | undefined, userId: string | undefined) {
  const [content, setContent] = useState<{
    spaces: any[];
    models: any[];
    datasets: any[];
  }>({ spaces: [], models: [], datasets: [] });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    async function loadContent() {
      if (!profileId) return;

      try {
        setLoading(true);
        setError(null);

        const [spaces, models, datasets] = await Promise.all([
          withRetry(() => supabase
            .from('spaces')
            .select('*, space_tags (tag)')
            .eq('author_id', profileId)
            .or(`is_private.eq.false,author_id.eq.${userId}`)
            .order('created_at', { ascending: false })),
          withRetry(() => supabase
            .from('models')
            .select('*, model_tags (tag)')
            .eq('author_id', profileId)
            .or(`is_private.eq.false,author_id.eq.${userId}`)
            .order('created_at', { ascending: false })),
          withRetry(() => supabase
            .from('datasets')
            .select('*, dataset_tags (tag)')
            .eq('author_id', profileId)
            .or(`is_private.eq.false,author_id.eq.${userId}`)
            .order('created_at', { ascending: false }))
        ]);

        if (spaces.error || models.error || datasets.error) {
          throw spaces.error || models.error || datasets.error;
        }

        setContent({
          spaces: spaces.data || [],
          models: models.data || [],
          datasets: datasets.data || []
        });
      } catch (err) {
        console.error('Error loading profile content:', err);
        setError(handleSupabaseError(err));
      } finally {
        setLoading(false);
      }
    }

    loadContent();
  }, [profileId, userId]);

  return { content, loading, error };
}