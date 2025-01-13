// Maximum lengths for profile fields
export const MAX_LENGTHS = {
  USERNAME: 50,
  DISPLAY_NAME: 100,
  BIO: 500,
  URL: 255,
  INTERESTS: 10
};

export function validateUsername(username: string): boolean {
  if (!username || username.length > MAX_LENGTHS.USERNAME) {
    return false;
  }
  // Only allow letters, numbers, and underscores
  return /^[a-zA-Z0-9_]+$/.test(username);
}

export function validateDisplayName(name: string | null): boolean {
  if (!name) return true; // Optional field
  return name.length <= MAX_LENGTHS.DISPLAY_NAME;
}

export function validateBio(bio: string | null): boolean {
  if (!bio) return true; // Optional field
  return bio.length <= MAX_LENGTHS.BIO;
}

export function validateUrl(url: string | null): boolean {
  if (!url) return true; // Optional field
  if (url.length > MAX_LENGTHS.URL) return false;
  try {
    new URL(url);
    return true;
  } catch {
    return false;
  }
}

export function validateInterests(interests: string[]): boolean {
  return Array.isArray(interests) && 
         interests.length <= MAX_LENGTHS.INTERESTS &&
         interests.every(interest => interest && typeof interest === 'string');
}

export function validateOrganizations(organizations: any[]): boolean {
  return Array.isArray(organizations) &&
         organizations.every(org => 
           org?.name && 
           typeof org.name === 'string' &&
           org?.role && 
           typeof org.role === 'string'
         );
}