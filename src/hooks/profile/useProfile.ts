import { useAuthContext } from '../contexts/AuthContext';
import { useProfileData } from './useProfileData';
import { useProfileContent } from './useProfileContent';
import { formatContent } from '../../lib/formatters/contentFormatters';
import type { Profile } from '../types/profile';

export function useProfile() {
  const { user } = useAuthContext();
  const { profileData, loading: profileLoading, error: profileError } = useProfileData();
  const { content, loading: contentLoading, error: contentError } = 
    useProfileContent(profileData?.id, user?.id);
  const { updateProfile, loading: updateLoading } = useProfileUpdate();

  // Combine profile data with content
  const profile = profileData ? {
    ...profileData,
    ...formatContent(content, profileData)
  } : null;

  const error = profileError?.message || contentError?.message || null;

  return { 
    profile,
    loading: profileLoading || contentLoading || updateLoading,
    error,
    updateProfile
  };