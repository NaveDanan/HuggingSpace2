import React, { createContext, useContext, useState, useEffect } from 'react';
import type { User } from '@supabase/supabase-js';
import { db } from '../lib/db';
import { API_BASE_URL } from '../lib/constants';
// import { DATABASE_TYPE } from '../App';

interface AuthContextType {
  user: User | null;
  loading: boolean;
  error: Error | null;
  signIn: (email: string, password: string) => Promise<void>;
  signUp: (email: string, password: string) => Promise<void>;
  signOut: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | null>(null);
export const DATABASE_TYPE = import.meta.env.VITE_DATABASE;

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);
  const VITE_DATABASE_TYPE = DATABASE_TYPE;
  useEffect(() => {
    async function initAuth() {
      setLoading(true);
      try {
        if (VITE_DATABASE_TYPE === 'supabase') {
          console.log('VITE_DATABASE:', import.meta.env.VITE_DATABASE);
          const { data: { session }, error } = await db.auth.getSession();
          if (error) throw error;
          setUser(session?.user ?? null);
        } if (VITE_DATABASE_TYPE === 'postgresql') {
          console.log('Initializing authentication Nave...');
          console.log('VITE_DATABASE:', import.meta.env.VITE_DATABASE);
          const accessToken = localStorage.getItem('accessToken');

          if (!accessToken) {
            console.log('No access token found, user is not signed in.');
            setUser(null);
            return;
          }

          const response = await fetch(`${API_BASE_URL}/auth/session/`, {
            headers: {
              Authorization: `Bearer ${accessToken}`,
            },
          });

          if (!response.ok) {
            console.log('Token verification failed, attempting to refresh token...');
            const newAccessToken = await refreshAccessToken();
            if (!newAccessToken) {
              console.log('Failed to refresh token, user is not signed in.');
              setUser(null);
              return;
            }
          } else {
            const data = await response.json();
            console.log('User session restored:', data);
            setUser(data);
          }
        }
      } catch (err) {
        console.error('Failed to initialize authentication:', err);
        setUser(null);
      } finally {
        setLoading(false);
      }
    }

    initAuth();
  }, []);

  const refreshAccessToken = async () => {
    const refreshToken = localStorage.getItem('refreshToken');
    if (!refreshToken) {
      console.log('No refresh token found, cannot refresh access token.');
      return null;
    }

    try {
      const response = await fetch(`${API_BASE_URL}/auth/token/refresh/`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ refresh: refreshToken }),
      });

      if (!response.ok) {
        console.error('Failed to refresh access token.');
        localStorage.removeItem('accessToken');
        localStorage.removeItem('refreshToken');
        setUser(null);
        return null;
      }

      const data = await response.json();
      localStorage.setItem('accessToken', data.access);
      return data.access;
    } catch (err) {
      console.error('Error refreshing access token:', err);
      return null;
    }
  };

  const handleSignIn = async (email: string, password: string) => {
    setLoading(true);
    try {
      if (VITE_DATABASE_TYPE === 'postgresql') {
        console.log('Attempting sign-in with Django backend...');
        const body = JSON.stringify({ username: email, password });
        console.log('body:', body);
        const response = await fetch(`${API_BASE_URL}/auth/login/`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body,
          
        });
        if (!response.ok) {
          const errorData = await response.json();
          console.error('Django backend error:', errorData);
          throw new Error('Failed to sign in with Django backend');
        }
        const data = await response.json();
        console.log('Sign-in successful with Django:', data);
        localStorage.setItem('accessToken', data.access);
        localStorage.setItem('refreshToken', data.refresh);
        setUser(data.user); 
      } else {
        console.log('Attempting sign-in with Supabase...');
        const { data, error } = await db.auth.signInWithPassword({ email, password });
        if (error) throw error;
        console.log('Sign-in successful with Supabase:', data);
        setUser(data.user);
      }
      setError(null);
    } catch (err) {
      console.error('Sign-in error:', err);
      setError(err instanceof Error ? err : new Error('Failed to sign in'));
    } finally {
      setLoading(false);
    }
  };

  const handleSignUp = async (email: string, password: string) => {
    setLoading(true);
    try {
      if (VITE_DATABASE_TYPE === 'postgresql') {
        console.log('Attempting sign-up with Django backend...');
        const response = await fetch(`${API_BASE_URL}/auth/register/`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ 
            email,
            username: email.split('@')[0], 
            password,
            password2: password,}),
        });
        if (!response.ok) {
          const errorData = await response.json();
          console.error('Django backend error:', errorData);
          throw new Error('Failed to sign up with Django backend');
        }
        const data = await response.json();
        console.log('Sign-up successful with Django:', data);
        setUser(data);
      } else {
        console.log('Attempting sign-up with Supabase...');
        const { data, error } = await db.auth.signUp({ email, password });
        if (error) throw error;
        console.log('Sign-up successful with Supabase:', data);
        setUser(data.user);
      }
      setError(null);
    } catch (err) {
      console.error('Sign-up error:', err);
      setError(err instanceof Error ? err : new Error('Failed to sign up'));
    } finally {
      setLoading(false);
    }
  };

  const handleSignOut = async () => {
    setLoading(true);
    try {
      if (VITE_DATABASE_TYPE === 'postgresql') {
        console.log('Attempting sign-out with Django backend...');
        const refreshToken = localStorage.getItem('refreshToken');
        const response = await fetch(`${API_BASE_URL}/auth/logout/`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ refresh_token: refreshToken }),
        });
        if (!response.ok) {
          console.error('Failed to sign out with Django backend');
          throw new Error('Failed to sign out');
        }
        console.log('Sign-out successful with Django backend');
        localStorage.removeItem('accessToken');
        localStorage.removeItem('refreshToken');
        setUser(null);
      } else {
        console.log('Attempting sign-out with Supabase...');
        const { error } = await db.auth.signOut();
        if (error) throw error;
        console.log('Sign-out successful with Supabase');
      }
      setUser(null);
    } catch (err) {
      console.error('Sign-out error:', err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <AuthContext.Provider value={{ user, loading, error, signIn: handleSignIn, signUp: handleSignUp, signOut: handleSignOut }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuthContext() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuthContext must be used within an AuthProvider');
  }
  return context;
}
