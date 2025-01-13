import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { withRetry } from '../lib/supabase';
import { handleSupabaseError } from '../utils/error';
import { sleep } from '../utils/async';
import type { Profile } from '../types/profile';

export function useProfileData(username: string | undefined, userId: string | undefined) {
  const [profile, setProfile] = useState<Profile | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    async function loadProfile() {
      if (!username && !userId) {
        setLoading(false);
        return;
      }

      try {
        setLoading(true);
        setError(null);

        if (!username && !userId) {
          throw new Error('Username or user ID is required');
        }

        const profileQuery = username
          ? await withRetry(() => supabase.from('profiles').select('*').eq('username', username).single())
          : await withRetry(() => supabase.from('profiles').select('*').eq('id', userId).single());

        let { data: profileData, error: profileError } = profileQuery;

        if (profileError) {
          // Handle case where profile doesn't exist
          if ((profileError.code === 'PGRST116' || profileError.code === '406') && !username && userId) {
            await sleep(1000);

            // Check if profile was created while we waited
            const { data: existingProfile } = await supabase
              .from('profiles')
              .select('*')
              .eq('id', userId)
              .single();

            if (existingProfile) {
              profileData = existingProfile;
            } else {
              // Create new profile
              const newUsername = userId;
              const { data: newProfile, error: createError } = await withRetry(() =>
                supabase
                  .from('profiles')
                  .insert({ 
                    id: userId, 
                    username: newUsername,
                    created_at: new Date().toISOString()
                  })
                  .select()
                  .single()
              );

              if (createError) throw createError;
              profileData = newProfile;
            }
          } else {
            throw profileError;
          }
        }

        if (!profileData) {
          throw new Error('Unable to load profile');
        }

        setProfile(profileData);
      } catch (err) {
        console.error('Error loading profile data:', err);
        setError(handleSupabaseError(err));
      } finally {
        setLoading(false);
      }
    }

    loadProfile();
  }, [username, userId]);

  return { profile, loading, error };
}