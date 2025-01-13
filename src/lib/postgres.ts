import axios from 'axios';
import type { Database } from '../types/supabase';

const API_URL = 'http://127.0.0.1:8000/api';

interface DatabaseClient {
  auth: {
    signInWithPassword: (credentials: { email: string; password: string }) => Promise<{ data: { user: any; session: any } | null; error: Error | null }>;
    signOut: () => Promise<{ error: Error | null }>;
  };
  from: <T extends keyof Database['public']['Tables']>(
    table: T
  ) => DatabaseQueryBuilder<Database['public']['Tables'][T]>;
}

interface DatabaseQueryBuilder<T> {
  select: (columns?: string) => Promise<{ data: T[] | null; error: Error | null }>;
  insert: (values: Partial<T>) => Promise<{ data: T | null; error: Error | null }>;
  update: (values: Partial<T>) => Promise<{ data: T | null; error: Error | null }>;
  delete: () => Promise<{ error: Error | null }>;
}

export const postgresClient: DatabaseClient = {
  auth: {
    signInWithPassword: async ({ email, password }) => {
      try {
        const response = await axios.post<{ user: any; token: any }>(`${API_URL}/auth/login/`, { email, password });
        return {
          data: {
            user: (response.data as { user: any; token: any }).user,
            session: response.data.token
          },
          error: null
        };
      } catch (error) {
        return { data: null, error: error as Error };
      }
    },
    signOut: async () => {
      try {
        await axios.post(`${API_URL}/auth/logout/`);
        return { error: null };
      } catch (error) {
        return { error: error as Error };
      }
    }
  },
  from: <T extends keyof Database['public']['Tables']>(table: T) => ({
    select: async (columns?: string): Promise<{ data: Database['public']['Tables'][T]['Row'][] | null; error: Error | null }> => {
      try {
        const response = await axios.get(`${API_URL}/${table}/`);
        return { data: response.data, error: null };
      } catch (error) {
        return { data: null, error: error as Error };
      }
    },
    insert: async (values: Partial<Database['public']['Tables'][T]>) => {
      try {
        const response = await axios.post(`${API_URL}/${table}/`, values);
        return { data: response.data, error: null };
      } catch (error) {
        return { data: null, error: error as Error };
      }
    },
    update: async (values: Partial<Database['public']['Tables'][T]>) => {
      try {
        const response = await axios.patch(`${API_URL}/${table}/`, values);
        return { data: response.data, error: null };
      } catch (error) {
        return { data: null, error: error as Error };
      }
    },
    delete: async () => {
      try {
        await axios.delete(`${API_URL}/${table}/`);
        return { error: null };
      } catch (error) {
        return { error: error as Error };
      }
    }
  })
};