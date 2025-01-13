-- Enable Extensions
CREATE EXTENSION IF NOT EXISTS pgsodium;
CREATE EXTENSION IF NOT EXISTS pg_graphql;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS pgjwt;
CREATE EXTENSION IF NOT EXISTS supabase_vault;

-- Create roles with appropriate permissions
CREATE ROLE supabase_admin WITH LOGIN PASSWORD '69NaveDanan69';
CREATE ROLE pgbouncer;
CREATE ROLE supabase_auth_admin;
CREATE ROLE anon;
CREATE ROLE authenticated;
CREATE ROLE authenticater;
CREATE ROLE service_role;
CREATE ROLE dashboard_user;
CREATE ROLE supabase_realtime_admin;
CREATE ROLE supabase_storage_admin;

-- Grant all permissions to roles to supabase_admin
ALTER ROLE supabase_admin WITH
    LOGIN
    SUPERUSER
    CREATEROLE
    CREATEDB
    REPLICATION
    BYPASSRLS;
ALTER ROLE authenticater WITH
    LOGIN
    BYPASSRLS;

-- Ensure the 'postgres' user is a SUPERUSER
ALTER ROLE postgres WITH SUPERUSER;