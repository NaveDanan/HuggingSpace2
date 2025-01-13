import { db } from './db';
import { API_BASE_URL } from './constants';


const VITE_DATABASE_TYPE = 'postgresql';


export async function signIn(email: string, password: string) {
  if (VITE_DATABASE_TYPE === 'postgresql') {
    // Django backend logic
    const response = await fetch(`${API_BASE_URL}/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, password }),
      credentials: 'include',
    });
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.detail || 'Failed to sign in with Django backend');
    }
    const data = await response.json();
    return { user: data.user };
  } else {
    // Supabase v2 sign-in logic
    const { data, error } = await db.auth.signInWithPassword({ email, password });
    if (error) throw error;
    return { user: data.user };
  }
}

export async function signUp(email: string, password: string) {
  if (VITE_DATABASE_TYPE === 'postgresql') {
    // Django backend logic
    const response = await fetch(`${API_BASE_URL}/auth/register`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, password }),
    });
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.detail || 'Failed to sign up with Django backend');
    }
    const data = await response.json();
    return { user: data.user };
  } else {
    // Supabase v2 sign-up logic
    const { data, error } = await db.auth.signUp({ email, password });
    if (error) throw error;
    return { user: data.user };
  }
}

export async function signOut() {
  if (VITE_DATABASE_TYPE === 'postgresql') {
    // Django backend logic
    const response = await fetch(`${API_BASE_URL}/auth/logout`, {
      method: 'POST',
      credentials: 'include',
    });
    if (!response.ok) {
      throw new Error('Failed to sign out from Django backend');
    }
  } else {
    // Supabase v2 sign-out logic
    const { error } = await db.auth.signOut();
    if (error) throw error;
  }
}
