import { useState } from 'react';
import { supabase } from '../../lib/supabase';
import { useAuthContext } from '../../contexts/AuthContext';
import { handleSupabaseError } from '../../utils/error';
import { 
  validateUsername,
  validateDisplayName,
  validateBio,
  validateUrl,
  validateInterests,
  validateOrganizations
} from '../../lib/validation/profileValidation';
import type { Profile } from '../../types/profile';

export function useProfileUpdate() {
  const { user } = useAuthContext();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const updateProfile = async (updates: Partial<Profile>) => {
    if (!user?.id) {
      throw new Error('Must be logged in to update profile');
    }

    try {
      setLoading(true);
      setError(null);

      // Validate all fields
      if (updates.username && !validateUsername(updates.username)) {
        throw new Error('Invalid username format');
      }
      if (updates.display_name && !validateDisplayName(updates.display_name)) {
        throw new Error('Display name is too long');
      }
      if (updates.bio && !validateBio(updates.bio)) {
        throw new Error('Bio is too long');
      }
      if (updates.website_url && !validateUrl(updates.website_url)) {
        throw new Error('Invalid website URL');
      }
      if (updates.github_url && !validateUrl(updates.github_url)) {
        throw new Error('Invalid GitHub URL');
      }
      if (updates.interests && !validateInterests(updates.interests)) {
        throw new Error('Invalid interests format');
      }
      if (updates.organizations && !validateOrganizations(updates.organizations)) {
        throw new Error('Invalid organizations format');
      }

      const { error: updateError } = await supabase
        .from('profiles')
        .update(updates)
        .eq('id', user.id);

      if (updateError) throw updateError;
    } catch (err) {
      const error = handleSupabaseError(err);
      setError(error.message);
      throw error;
    } finally {
      setLoading(false);
    }
  };

  return { updateProfile, loading, error };
}