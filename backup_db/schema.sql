-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: framework_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.framework_type AS ENUM (
    'gradio',
    'streamlit',
    'custom',
    'pytorch',
    'tensorflow',
    'jax',
    'scikit-learn'
);


ALTER TYPE public.framework_type OWNER TO postgres;

--
-- Name: repo_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.repo_type AS ENUM (
    'model',
    'dataset',
    'space'
);


ALTER TYPE public.repo_type OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: create_file_changes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_file_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Insert file changes for each file in the commit
  INSERT INTO model_file_changes (commit_id, file_path, change_type)
  SELECT 
    NEW.id,
    unnest(NEW.files),
    'modified'
  ON CONFLICT DO NOTHING;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.create_file_changes() OWNER TO postgres;

--
-- Name: generate_slug(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_slug(title text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Convert to lowercase, replace spaces with hyphens, remove special chars
  RETURN lower(regexp_replace(
    regexp_replace(title, '[^a-zA-Z0-9\s-]', '', 'g'),
    '\s+', '-', 'g'
  ));
END;
$$;


ALTER FUNCTION public.generate_slug(title text) OWNER TO postgres;

--
-- Name: get_repo_type_from_path(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_repo_type_from_path(path text) RETURNS public.repo_type
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Path format: {user_id}/{type}/{model_id}/...
  RETURN CASE split_part(path, '/', 2)
    WHEN 'models' THEN 'model'::repo_type
    WHEN 'datasets' THEN 'dataset'::repo_type
    WHEN 'spaces' THEN 'space'::repo_type
    ELSE NULL
  END;
END;
$$;


ALTER FUNCTION public.get_repo_type_from_path(path text) OWNER TO postgres;

--
-- Name: handle_file_change_error(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_file_change_error() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Validate file path
    IF NEW.file_path IS NULL OR NEW.file_path = '' THEN
      RAISE EXCEPTION 'Invalid file path';
    END IF;

    -- Validate change type
    IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN
      RAISE EXCEPTION 'Invalid change type';
    END IF;

    -- Ensure commit exists
    IF NOT EXISTS (
      SELECT 1 FROM model_commits WHERE id = NEW.commit_id
    ) THEN
      RAISE EXCEPTION 'Invalid commit ID';
    END IF;

    RETURN NEW;
  EXCEPTION WHEN OTHERS THEN
    -- Log error and return NULL to prevent insert
    RAISE WARNING 'Error in file change: %', SQLERRM;
    RETURN NULL;
  END;
END;
$$;


ALTER FUNCTION public.handle_file_change_error() OWNER TO postgres;

--
-- Name: handle_github_oauth_callback(uuid, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_github_oauth_callback(user_id uuid, gh_id text, gh_username text, gh_token text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  UPDATE profiles
  SET 
    github_id = gh_id,
    github_username = gh_username,
    github_access_token = gh_token,
    github_url = 'https://github.com/' || gh_username,
    updated_at = now()
  WHERE id = user_id;
END;
$$;


ALTER FUNCTION public.handle_github_oauth_callback(user_id uuid, gh_id text, gh_username text, gh_token text) OWNER TO postgres;

--
-- Name: handle_model_commit(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_model_commit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Validate commit message
  IF NOT validate_commit_message(NEW.message) THEN
    RAISE EXCEPTION 'Invalid commit message: Message must be between 3 and 1000 characters and contain only valid characters';
  END IF;

  -- Clean message text
  NEW.message := trim(NEW.message);

  -- Generate commit hash
  NEW.hash := encode(digest(NEW.message || array_to_string(NEW.files, ',') || NEW.created_at::text, 'sha1'), 'hex');

  RETURN NEW;
EXCEPTION WHEN OTHERS THEN
  RAISE WARNING 'Error in commit: %', SQLERRM;
  RETURN NULL;
END;
$$;


ALTER FUNCTION public.handle_model_commit() OWNER TO postgres;

--
-- Name: handle_model_file_change(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_model_file_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Validate commit exists and user has access
  IF NOT EXISTS (
    SELECT 1 FROM model_commits mc
    JOIN models m ON mc.model_id = m.id
    WHERE mc.id = NEW.commit_id
    AND m.author_id = auth.uid()
  ) THEN
    RAISE EXCEPTION 'Invalid or inaccessible commit';
  END IF;

  -- Validate file path
  IF NEW.file_path IS NULL OR NEW.file_path = '' OR 
     NEW.file_path ~ '(\.\./|\.\.\\|^/|^\\|[<>:"|?*\x00-\x1F])' THEN
    RAISE EXCEPTION 'Invalid file path';
  END IF;

  -- Validate change type
  IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN
    RAISE EXCEPTION 'Invalid change type';
  END IF;

  RETURN NEW;
EXCEPTION WHEN OTHERS THEN
  -- Log error details
  RAISE WARNING 'Error in file change: %', SQLERRM;
  RETURN NULL;
END;
$$;


ALTER FUNCTION public.handle_model_file_change() OWNER TO postgres;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  INSERT INTO public.profiles (id, username, created_at)
  VALUES (
    new.id,
    COALESCE(
      new.raw_user_meta_data->>'username',
      SPLIT_PART(new.email, '@', 1)
    ),
    now()
  );
  RETURN new;
END;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: handle_storage_change(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_storage_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_owner_id uuid;
  v_type repo_type;
  v_is_folder boolean;
BEGIN
  -- Extract owner_id from path (first segment)
  v_owner_id := split_part(NEW.name, '/', 1)::uuid;
  
  -- Get type from path
  v_type := get_repo_type_from_path(NEW.name);
  
  -- Determine if it's a folder (ends with /)
  v_is_folder := NEW.name LIKE '%/';

  -- Handle different operations
  IF TG_OP = 'INSERT' THEN
    INSERT INTO repo (
      storage_id,
      type,
      owner_name,
      owner_id,
      full_path,
      is_folder
    )
    SELECT
      NEW.id,
      v_type,
      p.username,
      v_owner_id,
      NEW.name,
      v_is_folder
    FROM auth.users u
    JOIN profiles p ON p.id = u.id
    WHERE u.id = v_owner_id;

  ELSIF TG_OP = 'UPDATE' THEN
    UPDATE repo
    SET
      full_path = NEW.name,
      updated_at = now()
    WHERE storage_id = OLD.id;

  ELSIF TG_OP = 'DELETE' THEN
    DELETE FROM repo
    WHERE storage_id = OLD.id;
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_storage_change() OWNER TO postgres;

--
-- Name: retry_operation(integer, text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.retry_operation(max_attempts integer, operation_name text, VARIADIC args text[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  attempt integer := 1;
  success boolean := false;
BEGIN
  WHILE attempt <= max_attempts AND NOT success LOOP
    BEGIN
      -- Log attempt
      RAISE NOTICE 'Attempt % of % for operation %', attempt, max_attempts, operation_name;
      
      -- Execute operation based on args
      EXECUTE format(operation_name, VARIADIC args);
      
      success := true;
    EXCEPTION WHEN OTHERS THEN
      IF attempt = max_attempts THEN
        RAISE;
      END IF;
      -- Wait with exponential backoff
      PERFORM pg_sleep(power(2, attempt - 1));
      attempt := attempt + 1;
    END;
  END LOOP;
END;
$$;


ALTER FUNCTION public.retry_operation(max_attempts integer, operation_name text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: set_slug(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_slug() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.slug IS NULL THEN
    NEW.slug := generate_slug(NEW.title);
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_slug() OWNER TO postgres;

--
-- Name: update_profile_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_profile_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_profile_updated_at() OWNER TO postgres;

--
-- Name: update_repo_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_repo_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_repo_updated_at() OWNER TO postgres;

--
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at() OWNER TO postgres;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

--
-- Name: validate_commit_message(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_commit_message(message text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Check if message is null or empty
  IF message IS NULL OR trim(message) = '' THEN
    RETURN false;
  END IF;

  -- Check message length (between 3 and 1000 characters)
  IF length(trim(message)) < 3 OR length(message) > 1000 THEN
    RETURN false;
  END IF;

  -- Check for valid characters
  IF message ~ '[^\x20-\x7E\n]' THEN
    RETURN false;
  END IF;

  RETURN true;
END;
$$;


ALTER FUNCTION public.validate_commit_message(message text) OWNER TO postgres;

--
-- Name: validate_file_changes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_file_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Ensure file path is not empty
  IF NEW.file_path IS NULL OR NEW.file_path = '' THEN
    RAISE EXCEPTION 'File path cannot be empty';
  END IF;

  -- Ensure change type is valid
  IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN
    RAISE EXCEPTION 'Invalid change type';
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.validate_file_changes() OWNER TO postgres;

--
-- Name: validate_file_path(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_file_path(path text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Check if path is null or empty
  IF path IS NULL OR path = '' THEN
    RETURN false;
  END IF;

  -- Check for invalid characters
  IF path ~ '[<>:"|?*\x00-\x1F]' THEN
    RETURN false;
  END IF;

  -- Check for relative path traversal
  IF path ~ '(\.\./|\.\.\\)' THEN
    RETURN false;
  END IF;

  -- Check for absolute paths
  IF path ~ '^(/|\\|[A-Za-z]:)' THEN
    RETURN false;
  END IF;

  RETURN true;
END;
$$;


ALTER FUNCTION public.validate_file_path(path text) OWNER TO postgres;

--
-- Name: validate_model_file_change(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_model_file_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Validate file path
  IF NOT validate_file_path(NEW.file_path) THEN
    RAISE EXCEPTION 'Invalid file path';
  END IF;

  -- Validate change type
  IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN
    RAISE EXCEPTION 'Invalid change type';
  END IF;

  -- Ensure commit exists
  IF NOT EXISTS (
    SELECT 1 FROM model_commits WHERE id = NEW.commit_id
  ) THEN
    RAISE EXCEPTION 'Invalid commit ID';
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.validate_model_file_change() OWNER TO postgres;

--
-- Name: validate_organization_entry(jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_organization_entry(org jsonb) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN (
    jsonb_typeof(org->'id') = 'string' AND
    jsonb_typeof(org->'name') = 'string' AND
    jsonb_typeof(org->'role') = 'string'
  );
END;
$$;


ALTER FUNCTION public.validate_organization_entry(org jsonb) OWNER TO postgres;

--
-- Name: validate_organizations(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_organizations() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  org jsonb;
BEGIN
  IF NEW.organizations IS NOT NULL THEN
    FOR org IN SELECT * FROM jsonb_array_elements(NEW.organizations)
    LOOP
      IF NOT validate_organization_entry(org) THEN
        RAISE EXCEPTION 'Invalid organization entry structure';
      END IF;
    END LOOP;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.validate_organizations() OWNER TO postgres;

--
-- Name: validate_space_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_space_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Validate model type
  IF NEW.type = 'model' AND NOT EXISTS (
    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'model'
  ) THEN
    INSERT INTO space_tags (space_id, tag) VALUES (NEW.id, 'model');
  END IF;
  
  -- Validate dataset type
  IF NEW.type = 'dataset' AND NOT EXISTS (
    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'dataset'
  ) THEN
    INSERT INTO space_tags (space_id, tag) VALUES (NEW.id, 'dataset');
  END IF;
  
  -- Validate space type
  IF NEW.type = 'space' AND NOT EXISTS (
    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'space'
  ) THEN
    INSERT INTO space_tags (space_id, tag) VALUES (NEW.id, 'space');
  END IF;
  
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.validate_space_type() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    SET LOCAL realtime.topic TO topic;

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: extract_model_id(text); Type: FUNCTION; Schema: storage; Owner: postgres
--

CREATE FUNCTION storage.extract_model_id(path text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Extract first path segment (model ID)
  RETURN split_part(path, '/', 1);
END;
$$;


ALTER FUNCTION storage.extract_model_id(path text) OWNER TO postgres;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: validate_model_file_path(text); Type: FUNCTION; Schema: storage; Owner: postgres
--

CREATE FUNCTION storage.validate_model_file_path(path text) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
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
$_$;


ALTER FUNCTION storage.validate_model_file_path(path text) OWNER TO postgres;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dataset_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dataset_tags (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    dataset_id uuid,
    tag text NOT NULL
);


ALTER TABLE public.dataset_tags OWNER TO postgres;

--
-- Name: datasets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datasets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    author_id uuid NOT NULL,
    thumbnail_url text NOT NULL,
    type text NOT NULL,
    format text NOT NULL,
    size text NOT NULL,
    likes_count integer DEFAULT 0,
    forks_count integer DEFAULT 0,
    views_count integer DEFAULT 0,
    is_featured boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    is_private boolean DEFAULT false,
    is_owner boolean DEFAULT true,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.datasets OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.guardian_groupobjectpermission OWNER TO postgres;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.guardian_groupobjectpermission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guardian_userobjectpermission OWNER TO postgres;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.guardian_userobjectpermission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: model_commits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_commits (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    model_id uuid NOT NULL,
    author_id uuid NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    files text[] DEFAULT '{}'::text[] NOT NULL,
    hash text NOT NULL,
    CONSTRAINT message_characters CHECK ((message ~ '^[\x20-\x7E\n]*$'::text)),
    CONSTRAINT message_length CHECK (((length(message) >= 3) AND (length(message) <= 1000))),
    CONSTRAINT valid_hash CHECK ((hash ~ '^[0-9a-f]{40}$'::text))
);


ALTER TABLE public.model_commits OWNER TO postgres;

--
-- Name: model_file_changes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_file_changes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    commit_id uuid NOT NULL,
    file_path text NOT NULL,
    change_type text NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT model_file_changes_change_type_check CHECK ((change_type = ANY (ARRAY['added'::text, 'modified'::text, 'deleted'::text])))
);


ALTER TABLE public.model_file_changes OWNER TO postgres;

--
-- Name: model_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_tags (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    model_id uuid,
    tag text NOT NULL
);


ALTER TABLE public.model_tags OWNER TO postgres;

--
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.models (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    title text NOT NULL,
    description text NOT NULL,
    author_id uuid NOT NULL,
    thumbnail_url text NOT NULL,
    framework text NOT NULL,
    likes_count integer DEFAULT 0,
    forks_count integer DEFAULT 0,
    views_count integer DEFAULT 0,
    is_featured boolean DEFAULT false,
    is_private boolean DEFAULT false,
    type text DEFAULT 'model'::text NOT NULL,
    is_owner boolean DEFAULT true,
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT models_type_check CHECK ((type = 'model'::text))
);


ALTER TABLE public.models OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    username text NOT NULL,
    display_name text,
    avatar_url text,
    bio text,
    github_url text,
    website_url text,
    theme_preference text DEFAULT 'system'::text,
    github_id text,
    github_access_token text,
    github_username text,
    organizations jsonb DEFAULT '[]'::jsonb,
    interests text[] DEFAULT '{}'::text[],
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT profiles_theme_preference_check CHECK ((theme_preference = ANY (ARRAY['light'::text, 'dark'::text, 'system'::text]))),
    CONSTRAINT username_length CHECK ((char_length(username) >= 3)),
    CONSTRAINT valid_interests_length CHECK (((interests IS NULL) OR (array_length(interests, 1) <= 10))),
    CONSTRAINT valid_organizations_type CHECK ((jsonb_typeof(organizations) = 'array'::text))
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: repo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    storage_id text NOT NULL,
    type public.repo_type NOT NULL,
    owner_name text NOT NULL,
    owner_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    full_path text NOT NULL,
    is_folder boolean DEFAULT false NOT NULL
);


ALTER TABLE public.repo OWNER TO postgres;

--
-- Name: space_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.space_tags (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    space_id uuid,
    tag text NOT NULL
);


ALTER TABLE public.space_tags OWNER TO postgres;

--
-- Name: spaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spaces (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    title text NOT NULL,
    description text NOT NULL,
    author_id uuid NOT NULL,
    thumbnail_url text NOT NULL,
    likes_count integer DEFAULT 0,
    forks_count integer DEFAULT 0,
    views_count integer DEFAULT 0,
    is_featured boolean DEFAULT false,
    is_private boolean DEFAULT false,
    slug text,
    framework public.framework_type DEFAULT 'custom'::public.framework_type NOT NULL,
    type text DEFAULT 'space'::text NOT NULL,
    is_owner boolean DEFAULT true,
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT spaces_type_check CHECK ((type = ANY (ARRAY['space'::text, 'model'::text, 'dataset'::text])))
);


ALTER TABLE public.spaces OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE UNLOGGED TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER VIEW vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	f61cf575-8f22-437a-8e98-a6a8ae5f8869	{"action":"user_signedup","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-12-21 21:17:29.364789+00	
00000000-0000-0000-0000-000000000000	9e20709a-9abb-471a-be4f-5b90b947fab7	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-21 21:17:29.372982+00	
00000000-0000-0000-0000-000000000000	40320311-5da4-425f-ae5a-c14de82290d3	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-12-21 21:18:33.918745+00	
00000000-0000-0000-0000-000000000000	1bec6253-adc4-4c44-bc0e-ea581483bbed	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-21 21:20:00.487759+00	
00000000-0000-0000-0000-000000000000	2e79de0c-fe79-4f22-8b44-a00125404f44	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-21 22:19:57.382496+00	
00000000-0000-0000-0000-000000000000	e326c76f-b44a-4d70-9675-72e09e41ba68	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-21 22:19:57.383373+00	
00000000-0000-0000-0000-000000000000	2b4e3738-1ad9-4bbe-8fdf-e0677d7343bd	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-12-21 22:20:08.600146+00	
00000000-0000-0000-0000-000000000000	dd728a08-abdd-47b8-896e-69e818d4d94f	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-21 22:20:12.640492+00	
00000000-0000-0000-0000-000000000000	d6169815-e6ae-489c-a961-cf81ab8166e4	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-12-21 22:27:44.148296+00	
00000000-0000-0000-0000-000000000000	fc3974ad-dea3-4fa9-91a3-0350a6015edf	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-21 22:27:48.786575+00	
00000000-0000-0000-0000-000000000000	3396e377-ab64-4a58-8b9d-c2ce736e44fc	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 06:27:12.616962+00	
00000000-0000-0000-0000-000000000000	88707ac0-d75b-4fda-a748-69a6d5524a15	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 06:27:12.617814+00	
00000000-0000-0000-0000-000000000000	96f1eb11-d022-48ac-b918-3e8fe74a994b	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 07:39:25.066351+00	
00000000-0000-0000-0000-000000000000	3dbdd8a7-7115-4e92-bb40-c3fec9d83133	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 07:39:25.067662+00	
00000000-0000-0000-0000-000000000000	ef84f379-4402-432c-b1e8-09076d875a22	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-12-22 08:27:44.779358+00	
00000000-0000-0000-0000-000000000000	1ef01d17-11a8-41bf-abcd-c344c72853e9	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-22 08:27:54.65755+00	
00000000-0000-0000-0000-000000000000	6c8a48ed-4d0e-48da-a2f0-410f08942dee	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-12-22 08:27:59.275345+00	
00000000-0000-0000-0000-000000000000	c3263f87-ec26-4c2a-b09d-81a9a840b1f3	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-22 08:29:22.965894+00	
00000000-0000-0000-0000-000000000000	e479788d-6fac-4865-82e9-9118dd97a2b0	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 09:27:44.416065+00	
00000000-0000-0000-0000-000000000000	4b6d5e1b-39c6-4c22-bcc1-d70dbf085e50	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 09:27:44.418088+00	
00000000-0000-0000-0000-000000000000	0a031431-9e5d-4595-86da-bac811ea2aab	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 10:27:43.658612+00	
00000000-0000-0000-0000-000000000000	e0395eb3-7f1b-4c9a-860a-e0fbbd4c5eab	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 10:27:43.660328+00	
00000000-0000-0000-0000-000000000000	c30594b5-950f-415d-b9ab-7bea62be8b85	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 14:09:27.873205+00	
00000000-0000-0000-0000-000000000000	48929e9f-8881-4c91-b274-7960311b9c42	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 14:09:27.874051+00	
00000000-0000-0000-0000-000000000000	d47c383a-6613-401f-bc72-1d6d47e40857	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 16:34:24.405044+00	
00000000-0000-0000-0000-000000000000	7929b36a-2be7-4787-a6ea-d856eba0092e	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 16:34:24.414209+00	
00000000-0000-0000-0000-000000000000	4897c823-21c9-4fb0-98a1-ed9151059c58	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 17:36:16.434047+00	
00000000-0000-0000-0000-000000000000	3c10b8ae-cbd3-4c17-9200-b5f22e8149fb	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 17:36:16.435553+00	
00000000-0000-0000-0000-000000000000	7295df42-6b07-4f12-a51f-8d8930870b72	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 19:59:54.322898+00	
00000000-0000-0000-0000-000000000000	d322956f-a0b2-4e7a-8ff3-550222d9feae	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 19:59:54.323818+00	
00000000-0000-0000-0000-000000000000	56dc3975-90df-438b-a493-c96417fefe7d	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 20:59:45.827568+00	
00000000-0000-0000-0000-000000000000	6c25cf74-9ff9-449f-9f9d-973e24982b6b	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 20:59:45.830269+00	
00000000-0000-0000-0000-000000000000	5839c28a-e988-4a90-97a4-d0a384fa55b7	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 21:58:18.715852+00	
00000000-0000-0000-0000-000000000000	8fc50cb1-f478-4775-b1ae-7106e0194b81	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 21:58:18.716737+00	
00000000-0000-0000-0000-000000000000	25d6f2a1-2ba4-47f9-a8f5-aa2302e220bd	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 22:56:48.956205+00	
00000000-0000-0000-0000-000000000000	f8b5b9d4-0385-40e8-a562-d920297944b9	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 22:56:48.958554+00	
00000000-0000-0000-0000-000000000000	ff9514ba-92be-47dd-ba6c-e763ad905ce5	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 23:54:57.044643+00	
00000000-0000-0000-0000-000000000000	8e9b157d-1104-404a-9f0b-3c6c4190554f	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-22 23:54:57.046384+00	
00000000-0000-0000-0000-000000000000	c712fb93-60a8-4c04-ba82-624e3202482c	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-23 00:53:22.488572+00	
00000000-0000-0000-0000-000000000000	ad0a91de-e773-4187-9a46-444c587b8139	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-23 00:53:22.497108+00	
00000000-0000-0000-0000-000000000000	6b2c6430-ab2e-49a4-b34a-4738696240e4	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-23 13:00:47.613339+00	
00000000-0000-0000-0000-000000000000	2c58007c-00b1-4a45-9a67-51531dcfe5c9	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-23 13:00:47.622789+00	
00000000-0000-0000-0000-000000000000	b00886c9-d138-4e44-9d56-993b95eaf4b7	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-24 06:11:03.556076+00	
00000000-0000-0000-0000-000000000000	5d42420e-c7bc-4c1c-94d9-6bbe4870b71a	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-24 06:11:03.56753+00	
00000000-0000-0000-0000-000000000000	99472a2b-65d0-4c1e-8497-4ff67cbae04d	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 17:07:45.144207+00	
00000000-0000-0000-0000-000000000000	1bf1e24b-922f-4f48-b8a8-7a032e50a382	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 17:07:45.157969+00	
00000000-0000-0000-0000-000000000000	bb24617d-5855-4879-8163-406c993b57a0	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 18:13:18.188461+00	
00000000-0000-0000-0000-000000000000	7f17720b-3eb6-4662-ae1a-353115ba5b4a	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 18:13:18.190413+00	
00000000-0000-0000-0000-000000000000	d334ed8e-e002-4b41-a5c8-cb81c182b072	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 19:11:30.907047+00	
00000000-0000-0000-0000-000000000000	5b49b32a-e538-4465-97e4-491d872a5403	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 19:11:30.907938+00	
00000000-0000-0000-0000-000000000000	36b445dc-d5b2-4a28-9e74-a288f322959a	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 21:33:50.178678+00	
00000000-0000-0000-0000-000000000000	e097f19a-b395-4939-8a40-99edbd593cac	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-25 21:33:50.180776+00	
00000000-0000-0000-0000-000000000000	01aed0af-e8bb-46b4-91ab-e3af4801577e	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 13:37:14.26057+00	
00000000-0000-0000-0000-000000000000	bce76336-fc10-4b4a-97ff-2c88063529b3	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 13:37:14.270242+00	
00000000-0000-0000-0000-000000000000	944f04ca-6b41-408f-bf01-ea08134556bd	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-12-26 13:46:30.2673+00	
00000000-0000-0000-0000-000000000000	c949af52-78b2-4458-bd7c-60638bd5d638	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-26 13:46:51.502636+00	
00000000-0000-0000-0000-000000000000	d199a8ed-b144-4e06-a460-c5e0ccca4c6f	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-12-26 13:48:23.724603+00	
00000000-0000-0000-0000-000000000000	2b65d6a3-6da8-4b60-849f-d25c5942d833	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-26 13:48:39.330262+00	
00000000-0000-0000-0000-000000000000	74439a44-69aa-4fab-ba16-aa99327596a4	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-26 13:48:49.073441+00	
00000000-0000-0000-0000-000000000000	d59323ef-47c7-4cfb-a900-1f35caecc1b6	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 14:48:30.776785+00	
00000000-0000-0000-0000-000000000000	edb6fc7c-dc24-4adf-8419-918f15222eaf	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 14:48:30.779278+00	
00000000-0000-0000-0000-000000000000	a8d9304e-fa3e-41c1-9354-0294e0302c91	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 14:53:44.740162+00	
00000000-0000-0000-0000-000000000000	7d8177a4-65bb-4f83-99c1-5445a532321c	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 14:53:44.742254+00	
00000000-0000-0000-0000-000000000000	fb2c8655-b25b-4505-a30f-5315e7e49fa5	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 15:48:08.83375+00	
00000000-0000-0000-0000-000000000000	2f873d84-a9e5-4934-9cb0-1f9c421c340d	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 15:48:08.835799+00	
00000000-0000-0000-0000-000000000000	effbb03e-9ae0-4ad2-9f79-249669bb71d4	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 16:46:37.221834+00	
00000000-0000-0000-0000-000000000000	488799ff-e175-44f2-a6e0-e9df8060340c	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 16:46:37.224417+00	
00000000-0000-0000-0000-000000000000	57afa33c-9df9-4fb9-8f3c-7818fec1db47	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 17:17:57.874629+00	
00000000-0000-0000-0000-000000000000	ed37d93b-af2d-476a-ad60-677d63564068	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 17:17:57.877032+00	
00000000-0000-0000-0000-000000000000	f6947a47-4e6b-411e-afb7-d5ca4c4e103a	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 17:47:57.067991+00	
00000000-0000-0000-0000-000000000000	5db89cd0-a15c-49bb-85d4-2a9ada8f4562	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 17:47:57.069695+00	
00000000-0000-0000-0000-000000000000	8c80de6e-da81-409a-ad50-23b55db3e003	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 18:43:39.997392+00	
00000000-0000-0000-0000-000000000000	c217204b-b5a9-485c-8008-b958ebcf8e7b	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 18:43:39.999584+00	
00000000-0000-0000-0000-000000000000	e2d5147b-96c2-4b5c-a9ef-9290e2b86bbc	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 18:46:03.74404+00	
00000000-0000-0000-0000-000000000000	7a4360bd-e2c7-4eea-bbeb-734d5f459dd7	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 18:46:03.744883+00	
00000000-0000-0000-0000-000000000000	2fe8a521-dd06-4d73-b747-e6b10e2e9a89	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 19:52:46.865598+00	
00000000-0000-0000-0000-000000000000	f3830a6d-9311-4414-9b0d-6da1736a1fa8	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 19:52:46.867578+00	
00000000-0000-0000-0000-000000000000	45d14271-1406-4a94-ab6c-8609f0a2db0d	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 19:57:56.351227+00	
00000000-0000-0000-0000-000000000000	4c34f96f-02e5-47f5-ad02-d74e613d5894	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-26 19:57:56.353337+00	
00000000-0000-0000-0000-000000000000	c5d0217a-ec0f-444a-bdad-37b57b797ba4	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-27 14:12:28.346959+00	
00000000-0000-0000-0000-000000000000	ab2d96c7-b3d3-4fa5-bcdb-09c7a266bcf9	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-27 14:12:28.359844+00	
00000000-0000-0000-0000-000000000000	b5dde58b-186e-4de0-80fb-a6397ddd6756	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 08:25:09.07144+00	
00000000-0000-0000-0000-000000000000	39185dde-f7d5-432d-8cb2-9d3fc86dadc2	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 08:25:09.094226+00	
00000000-0000-0000-0000-000000000000	2927e3f5-f90b-4f90-acdc-7f65f47d4ae7	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 09:47:15.329806+00	
00000000-0000-0000-0000-000000000000	765de3fa-f45a-4cfc-a7da-20745e4041b8	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 09:47:15.331307+00	
00000000-0000-0000-0000-000000000000	0e988235-6c02-4fd8-afb6-4bd274dd90ff	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-28 10:34:21.386369+00	
00000000-0000-0000-0000-000000000000	3621b055-c214-43fe-93d1-3bd7de0a3fbf	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 11:36:58.92823+00	
00000000-0000-0000-0000-000000000000	b7b65fc7-e740-4077-8b5b-f2ddb4ebed4b	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 11:36:58.93066+00	
00000000-0000-0000-0000-000000000000	8530fe03-52fd-4601-9bd0-7fd3cef40cae	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-28 11:58:28.271184+00	
00000000-0000-0000-0000-000000000000	5b3872a2-470c-4a45-a87b-4ec6a8640953	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 12:57:02.242328+00	
00000000-0000-0000-0000-000000000000	c77104ef-3145-426b-a84a-60b8a094c80e	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 12:57:02.245238+00	
00000000-0000-0000-0000-000000000000	1db15936-6029-4926-b31f-92ec86ceb90f	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 13:49:18.576198+00	
00000000-0000-0000-0000-000000000000	5b8ee33a-9ddb-4923-a686-dafe3eb9f2b9	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 13:49:18.57757+00	
00000000-0000-0000-0000-000000000000	38a193c3-2d36-4df0-88da-0e4aa74e4341	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 15:11:27.067862+00	
00000000-0000-0000-0000-000000000000	f87427d1-a6e6-4ac8-b760-adea4b633462	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 15:11:27.07033+00	
00000000-0000-0000-0000-000000000000	24249600-1d26-4c89-81e6-edd7cd8861e3	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 15:13:28.466477+00	
00000000-0000-0000-0000-000000000000	a3ff8b1a-2ce0-4b25-8e81-e9bc3dccc6a6	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 15:13:28.469424+00	
00000000-0000-0000-0000-000000000000	87f5e68f-e3d2-49f5-9e81-e2c631a7beb1	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 16:16:17.99407+00	
00000000-0000-0000-0000-000000000000	30d2b857-3e66-4525-84db-dc62b6b1f15e	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 16:16:18.002035+00	
00000000-0000-0000-0000-000000000000	5a3c02e3-e427-4cab-8a64-55ecb14e31ba	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 16:29:35.535622+00	
00000000-0000-0000-0000-000000000000	bc6f0959-6e8a-4197-a9d2-73ec82cbf9f2	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 16:29:35.538386+00	
00000000-0000-0000-0000-000000000000	7b75eaf3-956e-4cd1-8923-24d35947402f	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-28 16:38:43.100948+00	
00000000-0000-0000-0000-000000000000	71f1403f-f513-49e9-9aa9-8ab2c38b971c	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-28 17:00:08.19764+00	
00000000-0000-0000-0000-000000000000	d2d1f784-45ba-4153-ad46-97bd14709286	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 19:37:03.539548+00	
00000000-0000-0000-0000-000000000000	dd204898-d81a-44f0-8611-e59d296e4611	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 19:37:03.540454+00	
00000000-0000-0000-0000-000000000000	d33c7b11-c89e-41ae-8e28-a7aac7f1e4bb	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 19:37:54.754421+00	
00000000-0000-0000-0000-000000000000	af343f48-2db2-43c4-995b-8f31863953dc	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 19:37:54.75503+00	
00000000-0000-0000-0000-000000000000	223d0405-804d-4e0f-a049-06f05afdd9fd	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 19:44:27.105936+00	
00000000-0000-0000-0000-000000000000	f96048d5-6425-42a9-9fc1-4727fda77d8a	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 19:44:27.107946+00	
00000000-0000-0000-0000-000000000000	8dfbc8ad-d0db-4532-a6b4-c600dab65f6b	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-12-28 19:49:46.754793+00	
00000000-0000-0000-0000-000000000000	156d8262-3e9d-45d5-ba36-ea3026a59d4b	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 20:43:45.976257+00	
00000000-0000-0000-0000-000000000000	2ed16630-106b-4640-a423-c03676f04097	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 20:43:45.978415+00	
00000000-0000-0000-0000-000000000000	f26c85f8-55af-48be-9d82-b00f9370f265	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 20:46:25.436839+00	
00000000-0000-0000-0000-000000000000	f3e42c6a-5289-4b08-a5a9-3f667c1d683c	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 20:46:25.437838+00	
00000000-0000-0000-0000-000000000000	ab57db16-ca6a-4d63-8a1b-b474a2950aa0	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 21:07:28.783231+00	
00000000-0000-0000-0000-000000000000	cc66d036-9aee-4730-87cf-16954eb0d36a	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 21:07:28.784795+00	
00000000-0000-0000-0000-000000000000	3ad335bb-c179-42d1-99f4-86ee6ef2dbfd	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 21:44:48.705643+00	
00000000-0000-0000-0000-000000000000	d54707f1-99ec-483a-813c-fb919ce9b90f	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-12-28 21:44:48.708874+00	
00000000-0000-0000-0000-000000000000	190502bf-3a27-449c-9a5a-b7db79f837d2	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 16:58:54.546851+00	
00000000-0000-0000-0000-000000000000	c204782b-801a-4528-ad65-b152c27c70b3	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 16:58:54.559955+00	
00000000-0000-0000-0000-000000000000	07834a31-b3e4-4020-806b-bd3816d6ccd8	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 17:06:55.144535+00	
00000000-0000-0000-0000-000000000000	80bdb339-5a55-4e8f-98dc-febb2889347e	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 17:06:55.146752+00	
00000000-0000-0000-0000-000000000000	4a803b85-6074-4dfd-8ec2-ea3f762633a5	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 17:06:57.392274+00	
00000000-0000-0000-0000-000000000000	c9cb5914-c342-4c0a-b1fb-8eff7d96392e	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 21:01:53.625001+00	
00000000-0000-0000-0000-000000000000	1ecb484a-71cc-40d3-9247-23f04f82efcf	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 21:01:53.629895+00	
00000000-0000-0000-0000-000000000000	46e8fce7-5543-4dd9-842b-4b4a5ca91880	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 22:02:15.674714+00	
00000000-0000-0000-0000-000000000000	25029cc0-056c-4a1c-8cb7-df1dfe55d555	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 22:02:15.677258+00	
00000000-0000-0000-0000-000000000000	a7361cd9-5704-482e-932e-0ce44236edbe	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 22:19:36.79337+00	
00000000-0000-0000-0000-000000000000	587e9fa5-7c94-42e2-a690-2a4fc7d359cf	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 22:19:36.796076+00	
00000000-0000-0000-0000-000000000000	54b8bc6d-ea1a-4db1-86a2-ad9e74ec3994	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:00:16.865243+00	
00000000-0000-0000-0000-000000000000	7d21c671-9f1d-424d-9fd6-1a1ed51026d0	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:00:16.86812+00	
00000000-0000-0000-0000-000000000000	4ac90051-4b29-4c14-93fc-745f5f76cfe8	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:02:21.145172+00	
00000000-0000-0000-0000-000000000000	56b88fca-98cd-4183-89d5-504ebf58d2e3	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:02:21.147992+00	
00000000-0000-0000-0000-000000000000	b5161cb5-9310-4b44-8a65-abb0896dc772	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:04:22.901401+00	
00000000-0000-0000-0000-000000000000	ac18f669-59e2-4d7b-a7e3-b0401230d416	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:04:22.902236+00	
00000000-0000-0000-0000-000000000000	65ba94d6-2413-4f6d-8de9-a39ff4957a22	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:58:36.399797+00	
00000000-0000-0000-0000-000000000000	445ed529-afcf-4c1a-baf5-0e2dde17a81e	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-04 23:58:36.401589+00	
00000000-0000-0000-0000-000000000000	198e03cd-ef31-4c23-9d46-be956968cdd3	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-05 01:50:11.496154+00	
00000000-0000-0000-0000-000000000000	97a05d65-4249-42bc-a29b-08813b5a8e25	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-05 01:50:11.497612+00	
00000000-0000-0000-0000-000000000000	4f812aa4-d0fc-451c-901f-707ca0dd74b3	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-06 07:45:19.609086+00	
00000000-0000-0000-0000-000000000000	f47b9e6d-1b52-4214-8235-f42e86315f55	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-06 07:45:19.620129+00	
00000000-0000-0000-0000-000000000000	a71f3e77-98a3-4ca8-8017-65584871ee51	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-06 08:23:20.512547+00	
00000000-0000-0000-0000-000000000000	830d9c6b-3ed3-496a-9bd5-b2392a7e06b1	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-06 08:23:20.522809+00	
00000000-0000-0000-0000-000000000000	a408e618-1b7f-4f5a-a6e0-55034c0bf8ac	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-06 08:47:21.950131+00	
00000000-0000-0000-0000-000000000000	2d94dc4e-65b9-4523-97e7-b32b8b5c9d85	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-06 08:47:21.956102+00	
00000000-0000-0000-0000-000000000000	0aa1b62d-34fd-4f46-b2bc-df46b15b689c	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-01-06 09:02:14.244841+00	
00000000-0000-0000-0000-000000000000	ab0dbce0-a58c-457b-b696-f038bf2be086	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-01-07 13:56:56.376305+00	
00000000-0000-0000-0000-000000000000	1a4a6179-d74e-4920-b868-fd19f5dbf1e2	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 14:28:11.298811+00	
00000000-0000-0000-0000-000000000000	19f026d6-7f91-43c0-a602-fbf9eb320e56	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 14:28:11.301771+00	
00000000-0000-0000-0000-000000000000	1a2bc2a4-cc4a-405a-ad27-2c65bf3aff4e	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 17:08:21.592172+00	
00000000-0000-0000-0000-000000000000	d4a67e78-a796-4db4-86be-1868e52fead4	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 17:08:21.615307+00	
00000000-0000-0000-0000-000000000000	f75a2340-b481-4164-8abf-2c13f236a49e	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 17:48:35.548929+00	
00000000-0000-0000-0000-000000000000	5787cbb9-3ec3-4cd4-9413-ef11c2f90e4d	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 17:48:35.555336+00	
00000000-0000-0000-0000-000000000000	d637b891-d1ac-451d-8222-3737ec312afb	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 18:32:08.137923+00	
00000000-0000-0000-0000-000000000000	e2c811d8-57f0-46c6-a3de-04eddaaf0438	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 18:32:08.14134+00	
00000000-0000-0000-0000-000000000000	6abaed52-5b43-4864-9e7e-45af2d2e5424	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 21:56:44.195849+00	
00000000-0000-0000-0000-000000000000	30135ca7-2c2a-4a02-b58b-f5229d8a6fdb	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 21:56:44.204083+00	
00000000-0000-0000-0000-000000000000	38168c81-af38-4230-878b-22992ff17355	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 22:35:49.654421+00	
00000000-0000-0000-0000-000000000000	d207aa54-8334-4c2d-96d8-c66da8d3313b	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 22:35:49.656215+00	
00000000-0000-0000-0000-000000000000	0a2e2d24-e51c-4ed1-b41e-748c1fabbc45	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 23:36:24.313963+00	
00000000-0000-0000-0000-000000000000	642016c3-3c6f-44f3-b3ad-2376e99e79d9	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 23:36:24.314811+00	
00000000-0000-0000-0000-000000000000	00b5494f-8d32-4b05-a1dd-556051c70d71	{"action":"token_refreshed","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 23:45:49.957634+00	
00000000-0000-0000-0000-000000000000	a5ffb801-7980-41b4-ac7c-2991233dbda5	{"action":"token_revoked","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-01-07 23:45:49.982906+00	
00000000-0000-0000-0000-000000000000	e8d552c8-4440-42ec-86d8-4314c96bd88d	{"action":"logout","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-01-07 23:58:10.565401+00	
00000000-0000-0000-0000-000000000000	5ca7aecc-2c20-4062-b992-86c0bba76671	{"action":"login","actor_id":"834213f4-dad6-41a0-a04b-0fbc37881a71","actor_username":"nave0712@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-01-07 23:58:16.189399+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
834213f4-dad6-41a0-a04b-0fbc37881a71	834213f4-dad6-41a0-a04b-0fbc37881a71	{"sub": "834213f4-dad6-41a0-a04b-0fbc37881a71", "email": "nave0712@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-12-21 21:17:29.360721+00	2024-12-21 21:17:29.360777+00	2024-12-21 21:17:29.360777+00	9b330032-060d-4a5d-84b3-339c27851c20
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
4030b681-df70-4b09-9931-66bb8bdfa5cd	2025-01-07 23:58:16.216708+00	2025-01-07 23:58:16.216708+00	password	5c5f4dda-a690-4b09-b6c0-77e9cacd3a06
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	86	1EjtXVQI3us9gypTGQdI1A	834213f4-dad6-41a0-a04b-0fbc37881a71	f	2025-01-07 23:58:16.203129+00	2025-01-07 23:58:16.203129+00	\N	4030b681-df70-4b09-9931-66bb8bdfa5cd
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
4030b681-df70-4b09-9931-66bb8bdfa5cd	834213f4-dad6-41a0-a04b-0fbc37881a71	2025-01-07 23:58:16.195504+00	2025-01-07 23:58:16.195504+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0	77.127.198.117	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	834213f4-dad6-41a0-a04b-0fbc37881a71	authenticated	authenticated	nave0712@gmail.com	$2a$10$ykrUY2dUl1n4pEvwt1mfDO6xMTVCKDLw8Ov4HQpu2HZeAJlyzwb1.	2024-12-21 21:17:29.368834+00	\N		\N		\N			\N	2025-01-07 23:58:16.195418+00	{"provider": "email", "providers": ["email"]}	{"sub": "834213f4-dad6-41a0-a04b-0fbc37881a71", "email": "nave0712@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-12-21 21:17:29.333442+00	2025-01-07 23:58:16.189205+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add group object permission	7	add_groupobjectpermission
26	Can change group object permission	7	change_groupobjectpermission
27	Can delete group object permission	7	delete_groupobjectpermission
28	Can view group object permission	7	view_groupobjectpermission
29	Can add user object permission	8	add_userobjectpermission
30	Can change user object permission	8	change_userobjectpermission
31	Can delete user object permission	8	delete_userobjectpermission
32	Can view user object permission	8	view_userobjectpermission
33	Can add datasets	9	add_datasets
34	Can change datasets	9	change_datasets
35	Can delete datasets	9	delete_datasets
36	Can view datasets	9	view_datasets
37	Can add dataset tags	10	add_datasettags
38	Can change dataset tags	10	change_datasettags
39	Can delete dataset tags	10	delete_datasettags
40	Can view dataset tags	10	view_datasettags
41	Can add django content type	11	add_djangocontenttype
42	Can change django content type	11	change_djangocontenttype
43	Can delete django content type	11	delete_djangocontenttype
44	Can view django content type	11	view_djangocontenttype
45	Can add django migrations	12	add_djangomigrations
46	Can change django migrations	12	change_djangomigrations
47	Can delete django migrations	12	delete_djangomigrations
48	Can view django migrations	12	view_djangomigrations
49	Can add model commits	13	add_modelcommits
50	Can change model commits	13	change_modelcommits
51	Can delete model commits	13	delete_modelcommits
52	Can view model commits	13	view_modelcommits
53	Can add model file changes	14	add_modelfilechanges
54	Can change model file changes	14	change_modelfilechanges
55	Can delete model file changes	14	delete_modelfilechanges
56	Can view model file changes	14	view_modelfilechanges
57	Can add models	15	add_models
58	Can change models	15	change_models
59	Can delete models	15	delete_models
60	Can view models	15	view_models
61	Can add model tags	16	add_modeltags
62	Can change model tags	16	change_modeltags
63	Can delete model tags	16	delete_modeltags
64	Can view model tags	16	view_modeltags
65	Can add profiles	17	add_profiles
66	Can change profiles	17	change_profiles
67	Can delete profiles	17	delete_profiles
68	Can view profiles	17	view_profiles
69	Can add repo	18	add_repo
70	Can change repo	18	change_repo
71	Can delete repo	18	delete_repo
72	Can view repo	18	view_repo
73	Can add spaces	19	add_spaces
74	Can change spaces	19	change_spaces
75	Can delete spaces	19	delete_spaces
76	Can view spaces	19	view_spaces
77	Can add space tags	20	add_spacetags
78	Can change space tags	20	change_spacetags
79	Can delete space tags	20	delete_spacetags
80	Can view space tags	20	view_spacetags
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!y2nvtkF3mvseW3psMAEwzxzpduKBLCEJbbCQV1V8	\N	f	AnonymousUser				f	t	2025-01-08 00:07:35.202544+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: dataset_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dataset_tags (id, dataset_id, tag) FROM stdin;
\.


--
-- Data for Name: datasets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datasets (id, title, description, author_id, thumbnail_url, type, format, size, likes_count, forks_count, views_count, is_featured, created_at, is_private, is_owner, updated_at) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	guardian	groupobjectpermission
8	guardian	userobjectpermission
9	users	datasets
10	users	datasettags
11	users	djangocontenttype
12	users	djangomigrations
13	users	modelcommits
14	users	modelfilechanges
15	users	models
16	users	modeltags
17	users	profiles
18	users	repo
19	users	spaces
20	users	spacetags
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-01-07 21:29:52.569159+00
2	auth	0001_initial	2025-01-08 00:07:13.693305+00
3	admin	0001_initial	2025-01-08 00:07:14.906766+00
4	admin	0002_logentry_remove_auto_add	2025-01-08 00:07:15.058539+00
5	admin	0003_logentry_add_action_flag_choices	2025-01-08 00:07:15.503807+00
6	contenttypes	0002_remove_content_type_name	2025-01-08 00:07:16.395867+00
7	auth	0002_alter_permission_name_max_length	2025-01-08 00:07:16.985311+00
8	auth	0003_alter_user_email_max_length	2025-01-08 00:07:17.576098+00
9	auth	0004_alter_user_username_opts	2025-01-08 00:07:17.87369+00
10	auth	0005_alter_user_last_login_null	2025-01-08 00:07:18.611452+00
11	auth	0006_require_contenttypes_0002	2025-01-08 00:07:18.906632+00
12	auth	0007_alter_validators_add_error_messages	2025-01-08 00:07:19.346685+00
13	auth	0008_alter_user_username_max_length	2025-01-08 00:07:20.097813+00
14	auth	0009_alter_user_last_name_max_length	2025-01-08 00:07:20.687079+00
15	auth	0010_alter_group_name_max_length	2025-01-08 00:07:21.288649+00
16	auth	0011_update_proxy_permissions	2025-01-08 00:07:21.608716+00
17	auth	0012_alter_user_first_name_max_length	2025-01-08 00:07:22.344316+00
18	guardian	0001_initial	2025-01-08 00:07:25.351039+00
19	guardian	0002_generic_permissions_index	2025-01-08 00:07:25.958989+00
20	sessions	0001_initial	2025-01-08 00:07:26.999703+00
21	users	0001_initial	2025-01-08 00:07:27.153793+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
\.


--
-- Data for Name: model_commits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_commits (id, model_id, author_id, message, created_at, files, hash) FROM stdin;
65cfc44f-82e2-477b-b4e9-222df651437a	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:16:45.806298+00	{__init__.py}	46ee8c66e25c183343bd92fd974fdfb1e81cc6b8
1ae169bb-c653-40ba-a422-59e64970e2ca	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:20:01.86685+00	{__init__.py}	35d47cee6b6b800d0b9c0d415c80951417f8f66d
fd664115-b89d-4b08-b066-ffa8bf38cb69	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:21:19.182567+00	{__init__.py}	2f21d908d9ee2b711e6b887c98e19fac62b0176b
9daac2ad-7c62-482e-a918-7c83f1f4c37b	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:23:59.287575+00	{__init__.py}	cae7bcfe1b8b7533a8d9ad744d5b36fce67782a8
92df22f1-1244-40a8-a7b5-d86ecce3aa8a	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:26:08.330797+00	{__init__.py}	dc567933f1f0a026f33e6e54312cd53600425b94
9a92bb53-9458-4d78-8979-a3c6a2c2833c	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:27:30.692768+00	{__init__.py}	e44c9b15973ca7c869404c087c2da011c11d8ed5
44e15c59-5939-4c56-9ef3-8ea08c630598	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:28:46.11112+00	{__init__.py}	ceb0058d47a507ecfd708757837a33a1b6e764b6
b4cda1cb-ee98-49be-95ec-82837ae77ec5	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:30:05.425119+00	{__init__.py}	8b25b5cfc144a2f3070730a25a0297340e9dc5d6
b456841b-c04a-4321-8d55-2ef715068a00	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update LICENSE.md	2024-12-23 00:31:37.013803+00	{LICENSE.md}	de3b7c215a88ed081c493d185a26d8336cf59694
c9d1ef5c-0649-479e-9bd3-e9bcf8d804ec	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:35:10.908501+00	{__init__.py}	9e6368470c2c4dfb0a16b47b6b43ec4aac2b1123
e882097d-6f4b-4c3e-9a23-c64bd0a197e3	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:41:39.081044+00	{__init__.py}	1d50ce757437166a62603247ed003037ce6c59bd
8d5878d5-3e60-487e-8dc9-a1d2ba5aa1ab	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:44:30.763817+00	{__init__.py}	a9b9ed10ccbb88c9507c444c9cc60d3a36291ca3
bbe5b3f1-c498-4f98-a924-a552877fb93f	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 00:53:18.655215+00	{__init__.py}	0f745b8602043b711a45e4ab6696e63bae4e2bc7
8a9021a2-ba40-41a8-ab6f-316dfe0b9020	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Manual edit	2024-12-23 00:57:04.955394+00	{__init__.py}	fab01a989212cc16294b229dad275b54fc38f6d1
3eeacf57-ccbc-4678-a4c3-7ea748e3ca56	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 01:00:21.048853+00	{__init__.py}	91b01918bdb695649a3687b87ee130c49d251dc5
3808c88f-6f8c-41cc-b6c2-ab8a2f2e43ee	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 01:00:31.591389+00	{__init__.py}	e096e0bfed6b573071af2d2f7c8a2c05cea10ae8
a9fb16ba-f938-4467-92f4-f55631e924be	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 01:00:52.333096+00	{__init__.py}	d030fa059469040144bb1f54586105ec7916a7d1
5e4ad5d4-a6c8-44f0-9ead-20c823d069ad	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	manual 2	2024-12-23 01:02:01.752348+00	{__init__.py}	2ec1b674deabb3b5fd61c3680bbb8b7377f468e6
97ed35dc-d861-4746-9360-0a0ae13b9781	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 01:04:36.402873+00	{__init__.py}	1150b1e0ab91bf13738fcd96ddb4c42e9e51876d
94193588-dd9a-4de4-8ca7-5f15d95c1f4d	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Update __init__.py	2024-12-23 01:08:31.270469+00	{__init__.py}	3260562d230bdc5cfd4cdfcaf279d7ea9ce5981e
ed6cc120-dfc5-4c8c-bf78-26bfbf8da94e	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	nave test	2024-12-23 01:34:12.718419+00	{__init__.py}	596abc74a88c75711a578d63250287f08b6df356
56e21b19-901e-4f6d-a350-d3cfc83dc027	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Remove back space	2024-12-26 19:59:55.792625+00	{README.md}	cf8f6872c4971f94a1fc9ecb63664790a2772e92
fa94dd6e-c0f4-4aa3-a208-b58afb66cc9f	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	adding new file	2024-12-26 20:12:32.004459+00	{nave.py}	0acdc56fbd3fd1283199af7ac83e7b659e90dafa
827e8d13-c1bc-4157-a970-01053f858e4e	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Add file: nave2.py	2024-12-28 21:20:03.004671+00	{nave2.py}	2fbd46d2a71f95ad76f282a11f5ac043d4ba0435
7c2f24dc-736c-4923-ad5b-d38c87efc5d3	b0350842-e838-4b0a-9cf5-57d9c6a91544	834213f4-dad6-41a0-a04b-0fbc37881a71	Create folder: NONO	2024-12-28 21:27:20.64801+00	{NONO/.gitkeep}	7d02f6975915beebef50e289f9a5aba9033077bd
\.


--
-- Data for Name: model_file_changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_file_changes (id, commit_id, file_path, change_type, created_at) FROM stdin;
4a08bb28-0468-4160-917f-1ca593327be9	fd664115-b89d-4b08-b066-ffa8bf38cb69	__init__.py	modified	2024-12-23 00:21:19.43015+00
354c5d69-f01a-46b8-809f-4edb34dec00a	9daac2ad-7c62-482e-a918-7c83f1f4c37b	__init__.py	modified	2024-12-23 00:23:59.642149+00
8bfe56ae-d178-4e56-9abe-f43ff94e760e	92df22f1-1244-40a8-a7b5-d86ecce3aa8a	__init__.py	modified	2024-12-23 00:26:08.663318+00
ac56e9fd-ceb6-41d3-a2cb-3369774be023	c9d1ef5c-0649-479e-9bd3-e9bcf8d804ec	__init__.py	modified	2024-12-23 00:35:10.908501+00
67780172-fb75-4122-b61d-a3103502afb0	e882097d-6f4b-4c3e-9a23-c64bd0a197e3	__init__.py	modified	2024-12-23 00:41:39.081044+00
0763d524-03d1-4793-8c7b-797497030109	8d5878d5-3e60-487e-8dc9-a1d2ba5aa1ab	__init__.py	modified	2024-12-23 00:44:30.763817+00
26a90458-2dfc-4213-b7ce-3df4464991e9	bbe5b3f1-c498-4f98-a924-a552877fb93f	__init__.py	modified	2024-12-23 00:53:18.655215+00
0714167e-659f-431e-8f06-7690d788ebfb	8a9021a2-ba40-41a8-ab6f-316dfe0b9020	__init__.py	modified	2024-12-23 00:57:04.955394+00
4528ffaf-5dac-45b0-890d-2740fec7d67a	3eeacf57-ccbc-4678-a4c3-7ea748e3ca56	__init__.py	modified	2024-12-23 01:00:21.048853+00
ac8ddf0d-85dc-4d7b-ae0a-eeb04a9e1f03	3808c88f-6f8c-41cc-b6c2-ab8a2f2e43ee	__init__.py	modified	2024-12-23 01:00:31.591389+00
5070bb9b-7d3a-4715-98a7-9dd58b69f1b9	a9fb16ba-f938-4467-92f4-f55631e924be	__init__.py	modified	2024-12-23 01:00:52.333096+00
bce6ec64-c8ec-4720-abc1-c6fd78d70312	5e4ad5d4-a6c8-44f0-9ead-20c823d069ad	__init__.py	modified	2024-12-23 01:02:01.752348+00
27912dc5-b2d8-4049-9c2e-bb716ea67755	97ed35dc-d861-4746-9360-0a0ae13b9781	__init__.py	modified	2024-12-23 01:04:36.402873+00
abdae98e-e41d-453c-af02-24b5994bf226	94193588-dd9a-4de4-8ca7-5f15d95c1f4d	__init__.py	modified	2024-12-23 01:08:31.270469+00
848549b7-6aa4-4a5f-ac54-790629e17fc2	ed6cc120-dfc5-4c8c-bf78-26bfbf8da94e	__init__.py	modified	2024-12-23 01:34:12.718419+00
74cfab0a-bcf3-4db9-8f1a-87824016b870	56e21b19-901e-4f6d-a350-d3cfc83dc027	README.md	modified	2024-12-26 19:59:55.792625+00
b76aa341-43b0-40ca-a8e2-ccf2961a3741	fa94dd6e-c0f4-4aa3-a208-b58afb66cc9f	nave.py	modified	2024-12-26 20:12:32.004459+00
1f606bb7-29e8-4ed6-ba01-3f2138a983ea	827e8d13-c1bc-4157-a970-01053f858e4e	nave2.py	modified	2024-12-28 21:20:03.004671+00
f896f15b-1fa2-4f6f-af66-499f65f59a9c	7c2f24dc-736c-4923-ad5b-d38c87efc5d3	NONO/.gitkeep	modified	2024-12-28 21:27:20.64801+00
\.


--
-- Data for Name: model_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_tags (id, model_id, tag) FROM stdin;
1b71e534-ad19-4a68-b6eb-2ebfc60af031	9467ad1d-a09f-4858-a44c-f71947f81631	pytorch
2c2677a9-3b1e-4d5e-8133-fbbb177889af	9467ad1d-a09f-4858-a44c-f71947f81631	text-generation
b9a486da-40f8-4c21-b30e-6d5909986267	b0350842-e838-4b0a-9cf5-57d9c6a91544	pytorch
c6dba016-bc93-4f75-8f18-1c726f8bb70b	b0350842-e838-4b0a-9cf5-57d9c6a91544	text-generation
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.models (id, created_at, title, description, author_id, thumbnail_url, framework, likes_count, forks_count, views_count, is_featured, is_private, type, is_owner, updated_at) FROM stdin;
9467ad1d-a09f-4858-a44c-f71947f81631	2024-12-22 09:33:00.948175+00	test-model-private	test for private model	834213f4-dad6-41a0-a04b-0fbc37881a71	/src/images/model-default.png	pytorch	0	0	0	f	t	model	t	2024-12-22 21:59:42.804615+00
b0350842-e838-4b0a-9cf5-57d9c6a91544	2024-12-22 09:31:55.853844+00	test-model	model test for testing	834213f4-dad6-41a0-a04b-0fbc37881a71	/src/images/model-default.png	pytorch	0	0	0	t	f	model	t	2024-12-22 22:00:42.622586+00
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, created_at, username, display_name, avatar_url, bio, github_url, website_url, theme_preference, github_id, github_access_token, github_username, organizations, interests, updated_at) FROM stdin;
834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-21 21:44:49.697577+00	NaveDanan	NaveD	https://jortmpjhmbzeteixuqgu.supabase.co/storage/v1/object/public/avatars/0.3842773869770737.jpg	DaKing			light	\N	\N	\N	[]	{"Computer Vision","Deep Learning","Natural Language Processing"}	2024-12-28 16:25:40.115124+00
\.


--
-- Data for Name: repo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo (id, storage_id, type, owner_name, owner_id, created_at, updated_at, full_path, is_folder) FROM stdin;
\.


--
-- Data for Name: space_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.space_tags (id, space_id, tag) FROM stdin;
b81a56c1-6926-45d0-ba2e-b82a0fe76c44	56935791-916c-433c-9671-06c22453f6c2	machine-learning
8e61f91f-f7a4-41d9-8c1f-37319a7ce1cf	56935791-916c-433c-9671-06c22453f6c2	computer-vision
f6d34b01-52e1-4d18-b3d4-6d288bedc1a1	56935791-916c-433c-9671-06c22453f6c2	demo
07093c63-ffef-441f-b442-e1ee2ba9a0e8	56935791-916c-433c-9671-06c22453f6c2	image-classification
fcdb15c7-fd15-4f6e-bba1-bd88394f9889	56935791-916c-433c-9671-06c22453f6c2	pytorch
67a29b62-d9b4-405e-b904-7771de081edf	e7ee63c9-ccf2-4c05-a8b3-c9902725df93	space
9e448902-d471-4c58-bd85-34400a80eaea	56935791-916c-433c-9671-06c22453f6c2	space
\.


--
-- Data for Name: spaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spaces (id, created_at, title, description, author_id, thumbnail_url, likes_count, forks_count, views_count, is_featured, is_private, slug, framework, type, is_owner, updated_at) FROM stdin;
e7ee63c9-ccf2-4c05-a8b3-c9902725df93	2024-12-21 22:30:29.980553+00	test-1	test space	834213f4-dad6-41a0-a04b-0fbc37881a71	https://source.unsplash.com/random/800x600/?ai,technology&1734820230615	0	0	0	f	f	test-1	gradio	space	t	2024-12-22 21:59:42.804615+00
56935791-916c-433c-9671-06c22453f6c2	2024-12-21 22:28:34.951049+00	Image Classification Demo	A demo space showcasing image classification using a pre-trained ResNet model. Upload any image and get instant predictions!	834213f4-dad6-41a0-a04b-0fbc37881a71	https://source.unsplash.com/random/800x600/?ai,machine-learning	42	12	156	t	f	image-classification-demo	gradio	space	t	2024-12-22 21:59:42.804615+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-12-22 10:20:08
20211116045059	2024-12-22 10:20:09
20211116050929	2024-12-22 10:20:10
20211116051442	2024-12-22 10:20:10
20211116212300	2024-12-22 10:20:11
20211116213355	2024-12-22 10:20:12
20211116213934	2024-12-22 10:20:13
20211116214523	2024-12-22 10:20:14
20211122062447	2024-12-22 10:20:15
20211124070109	2024-12-22 10:20:15
20211202204204	2024-12-22 10:20:16
20211202204605	2024-12-22 10:20:17
20211210212804	2024-12-22 10:20:19
20211228014915	2024-12-22 10:20:20
20220107221237	2024-12-22 10:20:21
20220228202821	2024-12-22 10:20:22
20220312004840	2024-12-22 10:20:23
20220603231003	2024-12-22 10:20:24
20220603232444	2024-12-22 10:20:25
20220615214548	2024-12-22 10:20:25
20220712093339	2024-12-22 10:20:26
20220908172859	2024-12-22 10:20:27
20220916233421	2024-12-22 10:20:28
20230119133233	2024-12-22 10:20:29
20230128025114	2024-12-22 10:20:30
20230128025212	2024-12-22 10:20:30
20230227211149	2024-12-22 10:20:31
20230228184745	2024-12-22 10:20:32
20230308225145	2024-12-22 10:20:33
20230328144023	2024-12-22 10:20:33
20231018144023	2024-12-22 10:20:34
20231204144023	2024-12-22 10:20:36
20231204144024	2024-12-22 10:20:36
20231204144025	2024-12-22 10:20:37
20240108234812	2024-12-22 10:20:38
20240109165339	2024-12-22 10:20:39
20240227174441	2024-12-22 10:20:40
20240311171622	2024-12-22 10:20:41
20240321100241	2024-12-22 10:20:43
20240401105812	2024-12-22 10:20:45
20240418121054	2024-12-22 10:20:46
20240523004032	2024-12-22 10:20:49
20240618124746	2024-12-22 10:20:50
20240801235015	2024-12-22 10:20:50
20240805133720	2024-12-22 10:20:51
20240827160934	2024-12-22 10:20:52
20240919163303	2024-12-22 10:20:53
20240919163305	2024-12-22 10:20:54
20241019105805	2024-12-22 10:20:55
20241030150047	2024-12-22 10:20:57
20241108114728	2024-12-22 10:20:59
20241121104152	2024-12-22 10:20:59
20241130184212	2024-12-22 10:21:00
20241220035512	2025-01-08 23:38:49
20241220123912	2025-01-08 23:38:50
20241224161212	2025-01-08 23:38:51
20250107150512	2025-01-08 23:38:52
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
avatars	avatars	\N	2024-12-21 22:16:42.574451+00	2024-12-21 22:16:42.574451+00	t	f	\N	\N	\N
model-files	model-files	\N	2024-12-22 17:05:37.308626+00	2024-12-22 17:05:37.308626+00	f	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-12-21 20:45:39.716768
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-12-21 20:45:39.746077
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-12-21 20:45:39.802231
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-12-21 20:45:39.871728
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-12-21 20:45:39.940445
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-12-21 20:45:40.00393
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-12-21 20:45:40.055525
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-12-21 20:45:40.067459
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-12-21 20:45:40.120082
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-12-21 20:45:40.130835
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-12-21 20:45:40.146513
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-12-21 20:45:40.210049
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-12-21 20:45:40.263782
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-12-21 20:45:40.320322
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-12-21 20:45:40.331531
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-12-21 20:45:40.405276
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-12-21 20:45:40.459193
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-12-21 20:45:40.471598
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-12-21 20:45:40.523579
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-12-21 20:45:40.536165
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-12-21 20:45:40.546849
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-12-21 20:45:40.604167
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-12-21 20:45:40.67587
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-12-21 20:45:40.712565
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2024-12-21 20:45:40.723513
25	custom-metadata	67eb93b7e8d401cafcdc97f9ac779e71a79bfe03	2024-12-21 20:45:40.733809
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
d73b03e7-95bc-4d3a-bd01-edad734f77df	avatars	0.5313695583498366.jpg	834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-21 22:20:22.276747+00	2024-12-21 22:20:22.276747+00	2024-12-21 22:20:22.276747+00	{"eTag": "\\"13ce3a99124d3daa12c2f88f9881de33\\"", "size": 23965, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-12-21T22:20:23.000Z", "contentLength": 23965, "httpStatusCode": 200}	b17aaa34-8736-41cd-ad73-f264d21dce83	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
ff1f5ac7-875b-43ce-8b3c-6712bb1d5ee8	avatars	0.3842773869770737.jpg	834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-21 22:22:51.873106+00	2024-12-21 22:22:51.873106+00	2024-12-21 22:22:51.873106+00	{"eTag": "\\"13ce3a99124d3daa12c2f88f9881de33\\"", "size": 23965, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-12-21T22:22:52.000Z", "contentLength": 23965, "httpStatusCode": 200}	11538a8e-3fb6-4e83-b3b4-156d33c64c67	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
ecf1499a-2acd-4064-91fb-a38aa83a7273	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/.gitignore	834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-22 18:12:30.042617+00	2024-12-22 18:12:30.207438+00	2024-12-22 18:12:30.042617+00	{"eTag": "\\"07d977e798bf2e1c100c0084bde56205\\"", "size": 4062, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2024-12-22T18:12:31.000Z", "contentLength": 4062, "httpStatusCode": 200}	07d8e394-455f-4980-ae32-4046050ef351	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
5c4a5b74-3f99-4321-900b-c33b89ebcec1	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/__init__.py	834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-22 18:12:08.561065+00	2024-12-23 01:34:14.011803+00	2024-12-22 18:12:08.561065+00	{"eTag": "\\"e432a2ea6f558dff62041fbe358e8a7c\\"", "size": 97, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2024-12-23T01:34:14.000Z", "contentLength": 97, "httpStatusCode": 200}	1e9e5fe0-d2a1-47ef-8434-9349cf92b5fd	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
0c774c61-ab3c-4f62-91f9-d946250fc70d	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/LICENSE.md	834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-22 18:13:03.664808+00	2024-12-23 00:31:38.752439+00	2024-12-22 18:13:03.664808+00	{"eTag": "\\"13d7cc084854d680fc5e6a3ab5800096\\"", "size": 99, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2024-12-23T00:31:39.000Z", "contentLength": 99, "httpStatusCode": 200}	3228665d-5fdf-42b6-964d-78005646f823	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
f74e9eb4-fd1a-4fa5-8cc8-92621ac508b4	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/README.md	834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-22 23:25:23.011085+00	2024-12-26 19:59:57.1724+00	2024-12-22 23:25:23.011085+00	{"eTag": "\\"7fcd761b49d9a710e48d8ceea4a6743f\\"", "size": 3426, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2024-12-26T19:59:58.000Z", "contentLength": 3426, "httpStatusCode": 200}	43beb37b-78a2-4918-ade0-9400cdfa56b4	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
d5d3dd5d-3485-4eb0-aa09-88d6cc666a63	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/nave2.py	834213f4-dad6-41a0-a04b-0fbc37881a71	2024-12-28 21:20:02.679453+00	2024-12-28 21:20:02.679453+00	2024-12-28 21:20:02.679453+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2024-12-28T21:20:03.000Z", "contentLength": 0, "httpStatusCode": 200}	10ea508f-001e-40ab-91d9-5b1adf8d4b06	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
c4748d5e-597f-4bdb-91b4-76bd52fea84f	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/Untitled.ipynb	834213f4-dad6-41a0-a04b-0fbc37881a71	2025-01-04 23:50:46.406645+00	2025-01-04 23:50:46.406645+00	2025-01-04 23:50:46.406645+00	{"eTag": "\\"c407359a5b4cd3c4191d17702bfe5eba\\"", "size": 555, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2025-01-04T23:50:47.000Z", "contentLength": 555, "httpStatusCode": 200}	c1bf5c7a-fc62-4fc6-bcdc-78cdf02ba0f0	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
a7bbb445-72bc-465b-93a8-3c7d20c25b6d	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/DLI_Header.png	834213f4-dad6-41a0-a04b-0fbc37881a71	2025-01-04 23:50:47.909166+00	2025-01-04 23:50:47.909166+00	2025-01-04 23:50:47.909166+00	{"eTag": "\\"70f888bb8526cdab92f4e3134880c827\\"", "size": 48244, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2025-01-04T23:50:48.000Z", "contentLength": 48244, "httpStatusCode": 200}	4f591771-7363-45d4-9202-3c7abc0268fe	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
ee45c35d-fe19-4408-8f40-582e9422f610	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/elephant.jpg	834213f4-dad6-41a0-a04b-0fbc37881a71	2025-01-04 23:50:51.107206+00	2025-01-04 23:50:51.107206+00	2025-01-04 23:50:51.107206+00	{"eTag": "\\"206c1396072802799ad246f13e83e092-2\\"", "size": 7109987, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2025-01-04T23:50:51.000Z", "contentLength": 7109987, "httpStatusCode": 200}	4505bc73-e65f-4156-85d8-4376a117d0bf	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
b137b8b6-47f7-4cb6-85c6-e638fcff4806	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/goldfish.jpg	834213f4-dad6-41a0-a04b-0fbc37881a71	2025-01-04 23:50:51.873781+00	2025-01-04 23:50:51.873781+00	2025-01-04 23:50:51.873781+00	{"eTag": "\\"5ed67f4b5a0a184bf7b00d5266d0ca1b\\"", "size": 266119, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2025-01-04T23:50:52.000Z", "contentLength": 266119, "httpStatusCode": 200}	8e6f2b34-9ddb-496e-b7da-baa0b563efc9	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
88261f89-dc28-45ce-95c1-f08f43e2e488	model-files	834213f4-dad6-41a0-a04b-0fbc37881a71/models/b0350842-e838-4b0a-9cf5-57d9c6a91544/Prom_Add_Metric.png	834213f4-dad6-41a0-a04b-0fbc37881a71	2025-01-04 23:50:54.13929+00	2025-01-04 23:50:54.13929+00	2025-01-04 23:50:54.13929+00	{"eTag": "\\"4d38d8a4981f63f69fdc8446a1e10bc8\\"", "size": 124687, "mimetype": "text/plain", "cacheControl": "max-age=3600", "lastModified": "2025-01-04T23:50:54.000Z", "contentLength": 124687, "httpStatusCode": 200}	269b5db7-f872-4f0c-a8ab-af188a811aad	834213f4-dad6-41a0-a04b-0fbc37881a71	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
0001	{"\\\\n\\\\n-- Create custom types\\\\nCREATE TYPE framework_type AS ENUM ('gradio', 'streamlit', 'custom')","\\\\n\\\\n-- Create profiles table\\\\nCREATE TABLE IF NOT EXISTS profiles (\\\\n  id uuid PRIMARY KEY REFERENCES auth.users ON DELETE CASCADE,\\\\n  created_at timestamptz DEFAULT now(),\\\\n  username text UNIQUE NOT NULL,\\\\n  display_name text,\\\\n  avatar_url text,\\\\n  bio text,\\\\n  github_url text,\\\\n  website_url text,\\\\n  CONSTRAINT username_length CHECK (char_length(username) >= 3)\\\\n)","\\\\n\\\\n-- Create spaces table\\\\nCREATE TABLE IF NOT EXISTS spaces (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  created_at timestamptz DEFAULT now(),\\\\n  title text NOT NULL,\\\\n  description text NOT NULL,\\\\n  author_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,\\\\n  thumbnail_url text NOT NULL,\\\\n  framework framework_type NOT NULL,\\\\n  likes_count integer DEFAULT 0,\\\\n  forks_count integer DEFAULT 0,\\\\n  views_count integer DEFAULT 0,\\\\n  is_featured boolean DEFAULT false,\\\\n  is_private boolean DEFAULT false\\\\n)","\\\\n\\\\n-- Create space_tags table\\\\nCREATE TABLE IF NOT EXISTS space_tags (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  space_id uuid REFERENCES spaces(id) ON DELETE CASCADE,\\\\n  tag text NOT NULL,\\\\n  UNIQUE(space_id, tag)\\\\n)","\\\\n\\\\n-- Enable Row Level Security\\\\nALTER TABLE profiles ENABLE ROW LEVEL SECURITY","\\\\nALTER TABLE spaces ENABLE ROW LEVEL SECURITY","\\\\nALTER TABLE space_tags ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Profiles policies\\\\nCREATE POLICY \\"Public profiles are viewable by everyone\\"\\\\n  ON profiles\\\\n  FOR SELECT\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Users can update own profile\\"\\\\n  ON profiles\\\\n  FOR UPDATE\\\\n  USING (auth.uid() = id)","\\\\n\\\\n-- Spaces policies\\\\nCREATE POLICY \\"Public spaces are viewable by everyone\\"\\\\n  ON spaces\\\\n  FOR SELECT\\\\n  USING (NOT is_private OR auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can insert own spaces\\"\\\\n  ON spaces\\\\n  FOR INSERT\\\\n  WITH CHECK (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can update own spaces\\"\\\\n  ON spaces\\\\n  FOR UPDATE\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\n-- Space tags policies\\\\nCREATE POLICY \\"Space tags are viewable by everyone\\"\\\\n  ON space_tags\\\\n  FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_tags.space_id\\\\n      AND (NOT is_private OR auth.uid() = author_id)\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage tags for own spaces\\"\\\\n  ON space_tags\\\\n  FOR ALL\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_tags.space_id\\\\n      AND auth.uid() = author_id\\\\n    )\\\\n  )","\\\\n\\\\n-- Create indexes for better performance\\\\nCREATE INDEX spaces_author_id_idx ON spaces(author_id)","\\\\nCREATE INDEX space_tags_space_id_idx ON space_tags(space_id)","\\\\nCREATE INDEX space_tags_tag_idx ON space_tags(tag)",""}	wandering_mountain
0002	{"\\\\n\\\\n-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Users can insert own spaces\\" ON spaces","\\\\nDROP POLICY IF EXISTS \\"Public spaces are viewable by everyone\\" ON spaces","\\\\n\\\\n-- Create new policies\\\\nCREATE POLICY \\"Authenticated users can create spaces\\"\\\\n  ON spaces\\\\n  FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can view public spaces\\"\\\\n  ON spaces\\\\n  FOR SELECT\\\\n  TO public\\\\n  USING (NOT is_private)","\\\\n\\\\nCREATE POLICY \\"Users can view own spaces\\"\\\\n  ON spaces\\\\n  FOR SELECT\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)",""}	late_coral
0003	{"\\\\n\\\\n-- Create function to handle new user creation\\\\nCREATE OR REPLACE FUNCTION public.handle_new_user()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  INSERT INTO public.profiles (id, username, created_at)\\\\n  VALUES (\\\\n    new.id,\\\\n    COALESCE(new.raw_user_meta_data->>'username', SPLIT_PART(new.email, '@', 1)),\\\\n    now()\\\\n  )","\\\\n  RETURN new","\\\\nEND","\\\\n$$ LANGUAGE plpgsql SECURITY DEFINER","\\\\n\\\\n-- Create trigger to automatically create profile\\\\nDROP TRIGGER IF EXISTS on_auth_user_created ON auth.users","\\\\nCREATE TRIGGER on_auth_user_created\\\\n  AFTER INSERT ON auth.users\\\\n  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user()",""}	little_cloud
0004	{"\\\\n\\\\n-- Create function to handle new user creation\\\\nCREATE OR REPLACE FUNCTION public.handle_new_user()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  INSERT INTO public.profiles (id, username, created_at)\\\\n  VALUES (\\\\n    new.id,\\\\n    COALESCE(\\\\n      new.raw_user_meta_data->>'username',\\\\n      SPLIT_PART(new.email, '@', 1)\\\\n    ),\\\\n    now()\\\\n  )","\\\\n  RETURN new","\\\\nEND","\\\\n$$ LANGUAGE plpgsql SECURITY DEFINER","\\\\n\\\\n-- Create trigger to automatically create profile\\\\nDROP TRIGGER IF EXISTS on_auth_user_created ON auth.users","\\\\nCREATE TRIGGER on_auth_user_created\\\\n  AFTER INSERT ON auth.users\\\\n  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user()",""}	scarlet_desert
0005	{"\\\\n\\\\n-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Public profiles are viewable by everyone\\" ON profiles","\\\\nDROP POLICY IF EXISTS \\"Users can update own profile\\" ON profiles","\\\\n\\\\n-- Create new policies\\\\nCREATE POLICY \\"Profiles are viewable by everyone\\"\\\\n  ON profiles FOR SELECT\\\\n  TO public\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Users can insert their own profile\\"\\\\n  ON profiles FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (auth.uid() = id)","\\\\n\\\\nCREATE POLICY \\"Users can update their own profile\\"\\\\n  ON profiles FOR UPDATE\\\\n  TO authenticated\\\\n  USING (auth.uid() = id)\\\\n  WITH CHECK (auth.uid() = id)","\\\\n\\\\n-- Ensure RLS is enabled\\\\nALTER TABLE profiles ENABLE ROW LEVEL SECURITY",""}	crystal_snow
0006	{"\\\\n\\\\n-- Enable storage by creating the avatars bucket\\\\nINSERT INTO storage.buckets (id, name, public)\\\\nVALUES ('avatars', 'avatars', true)\\\\nON CONFLICT (id) DO NOTHING","\\\\n\\\\n-- Allow authenticated users to upload avatar images\\\\nCREATE POLICY \\"Avatar images are publicly accessible\\"\\\\n  ON storage.objects FOR SELECT\\\\n  TO public\\\\n  USING (bucket_id = 'avatars')","\\\\n\\\\nCREATE POLICY \\"Users can upload avatar images\\"\\\\n  ON storage.objects FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    bucket_id = 'avatars' AND\\\\n    (OCTET_LENGTH(DECODE(SUBSTRING(name FROM '[^.]+$'), 'escape')) <= 2097152) -- 2MB max\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can update their avatar images\\"\\\\n  ON storage.objects FOR UPDATE\\\\n  TO authenticated\\\\n  USING (bucket_id = 'avatars')\\\\n  WITH CHECK (bucket_id = 'avatars')","\\\\n\\\\nCREATE POLICY \\"Users can delete their avatar images\\"\\\\n  ON storage.objects FOR DELETE\\\\n  TO authenticated\\\\n  USING (bucket_id = 'avatars')",""}	withered_credit
0007	{"\\\\n\\\\n-- Ensure avatars bucket exists\\\\nINSERT INTO storage.buckets (id, name, public)\\\\nVALUES ('avatars', 'avatars', true)\\\\nON CONFLICT (id) DO NOTHING","\\\\n\\\\n-- Drop existing policies if they exist\\\\nDROP POLICY IF EXISTS \\"Avatar images are publicly accessible\\" ON storage.objects","\\\\nDROP POLICY IF EXISTS \\"Users can upload avatar images\\" ON storage.objects","\\\\nDROP POLICY IF EXISTS \\"Users can update their avatar images\\" ON storage.objects","\\\\nDROP POLICY IF EXISTS \\"Users can delete their avatar images\\" ON storage.objects","\\\\n\\\\n-- Recreate policies\\\\nCREATE POLICY \\"Avatar images are publicly accessible\\"\\\\n  ON storage.objects FOR SELECT\\\\n  TO public\\\\n  USING (bucket_id = 'avatars')","\\\\n\\\\nCREATE POLICY \\"Users can upload avatar images\\"\\\\n  ON storage.objects FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    bucket_id = 'avatars' AND\\\\n    (OCTET_LENGTH(DECODE(SUBSTRING(name FROM '[^.]+$'), 'escape')) <= 2097152) -- 2MB max\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can update their avatar images\\"\\\\n  ON storage.objects FOR UPDATE\\\\n  TO authenticated\\\\n  USING (bucket_id = 'avatars')\\\\n  WITH CHECK (bucket_id = 'avatars')","\\\\n\\\\nCREATE POLICY \\"Users can delete their avatar images\\"\\\\n  ON storage.objects FOR DELETE\\\\n  TO authenticated\\\\n  USING (bucket_id = 'avatars')",""}	stark_cliff
0008	{"\\\\n\\\\n-- Insert demo space\\\\nINSERT INTO public.spaces (\\\\n  title,\\\\n  description,\\\\n  author_id,\\\\n  thumbnail_url,\\\\n  framework,\\\\n  likes_count,\\\\n  forks_count,\\\\n  views_count,\\\\n  is_featured,\\\\n  is_private\\\\n) \\\\nSELECT \\\\n  'Image Classification Demo',\\\\n  'A demo space showcasing image classification using a pre-trained ResNet model. Upload any image and get instant predictions!',\\\\n  id,\\\\n  'https://source.unsplash.com/random/800x600/?ai,machine-learning',\\\\n  'gradio',\\\\n  42,\\\\n  12,\\\\n  156,\\\\n  true,\\\\n  false\\\\nFROM public.profiles\\\\nLIMIT 1","\\\\n\\\\n-- Add tags for the demo space\\\\nINSERT INTO public.space_tags (space_id, tag)\\\\nSELECT \\\\n  id,\\\\n  unnest(ARRAY['machine-learning', 'computer-vision', 'demo'])\\\\nFROM public.spaces\\\\nWHERE title = 'Image Classification Demo'",""}	empty_spark
0016	{"\\\\n\\\\n-- Set is_private to false for all existing spaces\\\\nUPDATE spaces\\\\nSET is_private = false\\\\nWHERE is_private IS NULL","\\\\n\\\\n-- Add default constraint to ensure new spaces are public by default\\\\nALTER TABLE spaces \\\\n  ALTER COLUMN is_private SET DEFAULT false","\\\\n\\\\n-- Create index for better performance on privacy queries\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_privacy \\\\nON spaces(is_private, author_id)\\\\nWHERE is_private = true","\\\\n\\\\n-- Create index for public content queries\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_public \\\\nON spaces(created_at DESC)\\\\nWHERE is_private = false",""}	sunny_hat
0009	{"\\\\n\\\\n-- Add slug field to spaces table\\\\nALTER TABLE spaces ADD COLUMN IF NOT EXISTS slug text","\\\\n\\\\n-- Create unique constraint for slug + author combination\\\\nALTER TABLE spaces \\\\nADD CONSTRAINT unique_slug_per_author \\\\nUNIQUE (author_id, slug)","\\\\n\\\\n-- Create function to generate slug\\\\nCREATE OR REPLACE FUNCTION generate_slug(title text)\\\\nRETURNS text AS $$\\\\nBEGIN\\\\n  -- Convert to lowercase, replace spaces with hyphens, remove special chars\\\\n  RETURN lower(regexp_replace(\\\\n    regexp_replace(title, '[^a-zA-Z0-9\\\\\\\\s-]', '', 'g'),\\\\n    '\\\\\\\\s+', '-', 'g'\\\\n  ))","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger to auto-generate slug\\\\nCREATE OR REPLACE FUNCTION set_slug()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  IF NEW.slug IS NULL THEN\\\\n    NEW.slug := generate_slug(NEW.title)","\\\\n  END IF","\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\nCREATE TRIGGER spaces_set_slug\\\\n  BEFORE INSERT OR UPDATE ON spaces\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION set_slug()",""}	odd_art
0010	{"-- Add theme_preference column to profiles table\\\\nALTER TABLE profiles \\\\nADD COLUMN IF NOT EXISTS theme_preference text \\\\nCHECK (theme_preference IN ('light', 'dark', 'system'))\\\\nDEFAULT 'system'","\\\\n\\\\n-- Update RLS policies\\\\nCREATE POLICY \\"Users can read their own theme preference\\"\\\\n  ON profiles\\\\n  FOR SELECT\\\\n  TO authenticated\\\\n  USING (auth.uid() = id)","\\\\n\\\\nCREATE POLICY \\"Users can update their own theme preference\\"\\\\n  ON profiles\\\\n  FOR UPDATE\\\\n  TO authenticated\\\\n  USING (auth.uid() = id)\\\\n  WITH CHECK (auth.uid() = id)",""}	white_cave
0011	{"\\\\n\\\\n-- First, get a user profile to associate the space with\\\\nDO $$\\\\nDECLARE\\\\n  target_profile_id uuid","\\\\nBEGIN\\\\n  -- Get the first profile from the profiles table\\\\n  SELECT id INTO target_profile_id FROM profiles LIMIT 1","\\\\n\\\\n  -- Only proceed if we have a profile\\\\n  IF target_profile_id IS NOT NULL THEN\\\\n    -- Update the demo space to be associated with this profile\\\\n    UPDATE spaces\\\\n    SET \\\\n      author_id = target_profile_id,\\\\n      title = 'Image Classification Demo',\\\\n      description = 'A demo space showcasing image classification using a pre-trained ResNet model. Upload any image and get instant predictions!',\\\\n      framework = 'gradio',\\\\n      thumbnail_url = 'https://source.unsplash.com/random/800x600/?ai,machine-learning',\\\\n      likes_count = 42,\\\\n      forks_count = 12,\\\\n      views_count = 156,\\\\n      is_featured = true,\\\\n      is_private = false,\\\\n      slug = 'image-classification-demo'\\\\n    WHERE title = 'Image Classification Demo'","\\\\n\\\\n    -- Update or insert space tags\\\\n    WITH new_tags AS (\\\\n      SELECT unnest(ARRAY['machine-learning', 'computer-vision', 'demo', 'image-classification', 'pytorch']) AS tag\\\\n    )\\\\n    INSERT INTO space_tags (space_id, tag)\\\\n    SELECT \\\\n      s.id,\\\\n      nt.tag\\\\n    FROM spaces s\\\\n    CROSS JOIN new_tags nt\\\\n    WHERE s.title = 'Image Classification Demo'\\\\n    ON CONFLICT (space_id, tag) DO NOTHING","\\\\n  END IF","\\\\nEND $$","\\\\n\\\\n-- Add indexes for better query performance\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_author_featured ON spaces(author_id) WHERE is_featured = true","\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_created_at ON spaces(created_at DESC)",""}	pale_jungle
0012	{"\\\\n\\\\n-- Add default thumbnails for spaces without one\\\\nUPDATE spaces\\\\nSET thumbnail_url = CASE\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = spaces.id \\\\n    AND st.tag = 'model'\\\\n  ) THEN 'https://source.unsplash.com/random/800x600/?ai,neural-network'\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = spaces.id \\\\n    AND st.tag = 'dataset'\\\\n  ) THEN 'https://source.unsplash.com/random/800x600/?data,analytics'\\\\n  ELSE 'https://source.unsplash.com/random/800x600/?workspace,collaboration'\\\\nEND\\\\nWHERE thumbnail_url IS NULL","\\\\n\\\\n-- Ensure all spaces have a valid author_id\\\\nDO $$\\\\nDECLARE\\\\n  default_profile_id uuid","\\\\nBEGIN\\\\n  -- Get a default profile ID (first one in the system)\\\\n  SELECT id INTO default_profile_id FROM profiles LIMIT 1","\\\\n  \\\\n  -- Update any spaces with invalid author_id\\\\n  UPDATE spaces\\\\n  SET author_id = default_profile_id\\\\n  WHERE author_id NOT IN (SELECT id FROM profiles)\\\\n  OR author_id IS NULL","\\\\nEND $$","\\\\n\\\\n-- Add indexes for better query performance\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_type_tag ON space_tags(tag) WHERE tag IN ('model', 'dataset', 'space')","\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_author_content ON spaces(author_id, created_at DESC)",""}	dry_cherry
0013	{"\\\\n\\\\nUPDATE spaces\\\\nSET thumbnail_url = CASE\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = spaces.id \\\\n    AND st.tag = 'model'\\\\n  ) THEN 'https://source.unsplash.com/random/800x600/?ai,neural-network'\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = spaces.id \\\\n    AND st.tag = 'dataset'\\\\n  ) THEN 'https://source.unsplash.com/random/800x600/?data,analytics'\\\\n  ELSE 'https://raw.githubusercontent.com/huggingface/huggingface.js/main/packages/hub/src/spaces-default.png'\\\\nEND\\\\nWHERE thumbnail_url IS NULL\\\\nOR thumbnail_url = 'https://source.unsplash.com/random/800x600/?workspace,collaboration'",""}	pale_bread
0014	{"\\\\n\\\\n-- Update foreign key constraint to cascade delete tags\\\\nALTER TABLE space_tags\\\\nDROP CONSTRAINT space_tags_space_id_fkey,\\\\nADD CONSTRAINT space_tags_space_id_fkey\\\\n  FOREIGN KEY (space_id)\\\\n  REFERENCES spaces(id)\\\\n  ON DELETE CASCADE","\\\\n\\\\n-- Add RLS policy for deletion\\\\nCREATE POLICY \\"Users can delete their own spaces\\"\\\\n  ON spaces\\\\n  FOR DELETE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\n-- Add indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_space_tags_space_id ON space_tags(space_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_author_id ON spaces(author_id)",""}	shiny_fire
0015	{"\\\\n\\\\n-- First create new enum type with all values\\\\nCREATE TYPE framework_type_new AS ENUM (\\\\n  'gradio',\\\\n  'streamlit', \\\\n  'custom',\\\\n  'pytorch',\\\\n  'tensorflow',\\\\n  'jax',\\\\n  'scikit-learn'\\\\n)","\\\\n\\\\n-- Create new column with new type\\\\nALTER TABLE spaces \\\\nADD COLUMN framework_temp framework_type_new","\\\\n\\\\n-- Update the new column, mapping existing values\\\\nUPDATE spaces\\\\nSET framework_temp = CASE \\\\n  WHEN framework::text = 'gradio' THEN 'gradio'::framework_type_new\\\\n  WHEN framework::text = 'streamlit' THEN 'streamlit'::framework_type_new\\\\n  WHEN framework::text = 'pytorch' THEN 'pytorch'::framework_type_new\\\\n  WHEN framework::text = 'tensorflow' THEN 'tensorflow'::framework_type_new\\\\n  WHEN framework::text = 'jax' THEN 'jax'::framework_type_new\\\\n  WHEN framework::text = 'scikit-learn' THEN 'scikit-learn'::framework_type_new\\\\n  ELSE 'custom'::framework_type_new\\\\nEND","\\\\n\\\\n-- Drop the old column and type\\\\nALTER TABLE spaces DROP COLUMN framework","\\\\nDROP TYPE IF EXISTS framework_type","\\\\n\\\\n-- Rename new type and column\\\\nALTER TYPE framework_type_new RENAME TO framework_type","\\\\nALTER TABLE spaces RENAME COLUMN framework_temp TO framework","\\\\n\\\\n-- Add NOT NULL constraint and set default\\\\nALTER TABLE spaces \\\\n  ALTER COLUMN framework SET NOT NULL,\\\\n  ALTER COLUMN framework SET DEFAULT 'custom'::framework_type","\\\\n\\\\n-- Add index for better query performance  \\\\nCREATE INDEX IF NOT EXISTS idx_spaces_framework ON spaces(framework)",""}	violet_king
0017	{"\\\\n\\\\n-- Create models table\\\\nCREATE TABLE IF NOT EXISTS models (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  space_id uuid NOT NULL REFERENCES spaces(id) ON DELETE CASCADE,\\\\n  framework text NOT NULL,\\\\n  task text NOT NULL,\\\\n  language text NOT NULL,\\\\n  created_at timestamptz DEFAULT now(),\\\\n  updated_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Create datasets table\\\\nCREATE TABLE IF NOT EXISTS datasets (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  space_id uuid NOT NULL REFERENCES spaces(id) ON DELETE CASCADE,\\\\n  type text NOT NULL,\\\\n  format text NOT NULL,\\\\n  size text NOT NULL,\\\\n  created_at timestamptz DEFAULT now(),\\\\n  updated_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE models ENABLE ROW LEVEL SECURITY","\\\\nALTER TABLE datasets ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create policies for models\\\\nCREATE POLICY \\"Models are viewable by everyone\\"\\\\n  ON models FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = models.space_id\\\\n      AND (NOT is_private OR spaces.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can insert their own models\\"\\\\n  ON models FOR INSERT\\\\n  WITH CHECK (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can update their own models\\"\\\\n  ON models FOR UPDATE\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can delete their own models\\"\\\\n  ON models FOR DELETE\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create policies for datasets\\\\nCREATE POLICY \\"Datasets are viewable by everyone\\"\\\\n  ON datasets FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = datasets.space_id\\\\n      AND (NOT is_private OR spaces.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can insert their own datasets\\"\\\\n  ON datasets FOR INSERT\\\\n  WITH CHECK (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can update their own datasets\\"\\\\n  ON datasets FOR UPDATE\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can delete their own datasets\\"\\\\n  ON datasets FOR DELETE\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM spaces\\\\n      WHERE id = space_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_models_space_id ON models(space_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_models_framework ON models(framework)","\\\\nCREATE INDEX IF NOT EXISTS idx_models_task ON models(task)","\\\\nCREATE INDEX IF NOT EXISTS idx_models_language ON models(language)","\\\\n\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_space_id ON datasets(space_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_type ON datasets(type)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_format ON datasets(format)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_size ON datasets(size)","\\\\n\\\\n-- Create function to update updated_at timestamp\\\\nCREATE OR REPLACE FUNCTION update_updated_at_column()\\\\nRETURNS TRIGGER AS $$\\\\nBEGIN\\\\n  NEW.updated_at = now()","\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ language 'plpgsql'","\\\\n\\\\n-- Create triggers for updated_at\\\\nCREATE TRIGGER update_models_updated_at\\\\n  BEFORE UPDATE ON models\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()","\\\\n\\\\nCREATE TRIGGER update_datasets_updated_at\\\\n  BEFORE UPDATE ON datasets\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()",""}	dark_morning
0018	{"\\\\n\\\\n-- Migrate models\\\\nINSERT INTO models (space_id, framework, task, language)\\\\nSELECT DISTINCT\\\\n  s.id as space_id,\\\\n  COALESCE(\\\\n    (SELECT tag FROM space_tags \\\\n     WHERE space_id = s.id \\\\n     AND tag IN ('pytorch', 'tensorflow', 'jax', 'scikit-learn')\\\\n     LIMIT 1\\\\n    ),\\\\n    'custom'\\\\n  ) as framework,\\\\n  COALESCE(\\\\n    (SELECT tag FROM space_tags \\\\n     WHERE space_id = s.id \\\\n     AND tag IN ('text-generation', 'image-classification', 'object-detection', 'translation', 'summarization')\\\\n     LIMIT 1\\\\n    ),\\\\n    'other'\\\\n  ) as task,\\\\n  COALESCE(\\\\n    (SELECT tag FROM space_tags \\\\n     WHERE space_id = s.id \\\\n     AND tag IN ('python', 'javascript', 'rust', 'cpp', 'java')\\\\n     LIMIT 1\\\\n    ),\\\\n    'python'\\\\n  ) as language\\\\nFROM spaces s\\\\nINNER JOIN space_tags st ON s.id = st.space_id\\\\nWHERE st.tag = 'model'","\\\\n\\\\n-- Migrate datasets\\\\nINSERT INTO datasets (space_id, type, format, size)\\\\nSELECT DISTINCT\\\\n  s.id as space_id,\\\\n  COALESCE(\\\\n    (SELECT tag FROM space_tags \\\\n     WHERE space_id = s.id \\\\n     AND tag IN ('tabular', 'image', 'text', 'audio', 'video')\\\\n     LIMIT 1\\\\n    ),\\\\n    'other'\\\\n  ) as type,\\\\n  COALESCE(\\\\n    (SELECT tag FROM space_tags \\\\n     WHERE space_id = s.id \\\\n     AND tag IN ('csv', 'json', 'parquet', 'arrow')\\\\n     LIMIT 1\\\\n    ),\\\\n    'custom'\\\\n  ) as format,\\\\n  COALESCE(\\\\n    (SELECT tag FROM space_tags \\\\n     WHERE space_id = s.id \\\\n     AND tag LIKE 'size:%'\\\\n     LIMIT 1\\\\n    ),\\\\n    'size:unknown'\\\\n  ) as size\\\\nFROM spaces s\\\\nINNER JOIN space_tags st ON s.id = st.space_id\\\\nWHERE st.tag = 'dataset'",""}	broad_flame
0019	{"\\\\n\\\\n-- Add type column to spaces table\\\\nALTER TABLE spaces \\\\nADD COLUMN IF NOT EXISTS type text NOT NULL \\\\nCHECK (type IN ('space', 'model', 'dataset'))\\\\nDEFAULT 'space'","\\\\n\\\\n-- Delete all records from models table\\\\nDELETE FROM models","\\\\n\\\\n-- Update existing spaces with correct type based on tags\\\\nUPDATE spaces s\\\\nSET type = CASE\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = s.id \\\\n    AND st.tag = 'model'\\\\n  ) THEN 'model'\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = s.id \\\\n    AND st.tag = 'dataset'\\\\n  ) THEN 'dataset'\\\\n  ELSE 'space'\\\\nEND","\\\\n\\\\n-- Create index for type column\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_type ON spaces(type)","\\\\n\\\\n-- Add trigger to ensure type matches tags\\\\nCREATE OR REPLACE FUNCTION validate_space_type()\\\\nRETURNS TRIGGER AS $$\\\\nBEGIN\\\\n  IF NEW.type = 'model' AND NOT EXISTS (\\\\n    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'model'\\\\n  ) THEN\\\\n    RAISE EXCEPTION 'Model spaces must have model tag'","\\\\n  END IF","\\\\n  \\\\n  IF NEW.type = 'dataset' AND NOT EXISTS (\\\\n    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'dataset'\\\\n  ) THEN\\\\n    RAISE EXCEPTION 'Dataset spaces must have dataset tag'","\\\\n  END IF","\\\\n  \\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\nCREATE TRIGGER ensure_space_type\\\\n  AFTER INSERT OR UPDATE ON spaces\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION validate_space_type()",""}	broad_sunset
0020	{"\\\\n\\\\n-- Add type column to spaces table if it doesn't exist\\\\nDO $$ \\\\nBEGIN\\\\n  IF NOT EXISTS (SELECT 1 FROM information_schema.columns \\\\n    WHERE table_name = 'spaces' AND column_name = 'type') \\\\n  THEN\\\\n    ALTER TABLE spaces \\\\n    ADD COLUMN type text NOT NULL \\\\n    CHECK (type IN ('space', 'model', 'dataset'))\\\\n    DEFAULT 'space'","\\\\n  END IF","\\\\nEND $$","\\\\n\\\\n-- Update existing spaces with correct type based on tags\\\\nUPDATE spaces s\\\\nSET type = CASE\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = s.id \\\\n    AND st.tag = 'model'\\\\n  ) THEN 'model'\\\\n  WHEN EXISTS (\\\\n    SELECT 1 FROM space_tags st \\\\n    WHERE st.space_id = s.id \\\\n    AND st.tag = 'dataset'\\\\n  ) THEN 'dataset'\\\\n  ELSE 'space'\\\\nEND","\\\\n\\\\n-- Create index for type column if it doesn't exist\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_type ON spaces(type)","\\\\n\\\\n-- Create or replace the validation trigger function\\\\nCREATE OR REPLACE FUNCTION validate_space_type()\\\\nRETURNS TRIGGER AS $$\\\\nBEGIN\\\\n  -- Validate model type\\\\n  IF NEW.type = 'model' AND NOT EXISTS (\\\\n    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'model'\\\\n  ) THEN\\\\n    INSERT INTO space_tags (space_id, tag) VALUES (NEW.id, 'model')","\\\\n  END IF","\\\\n  \\\\n  -- Validate dataset type\\\\n  IF NEW.type = 'dataset' AND NOT EXISTS (\\\\n    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'dataset'\\\\n  ) THEN\\\\n    INSERT INTO space_tags (space_id, tag) VALUES (NEW.id, 'dataset')","\\\\n  END IF","\\\\n  \\\\n  -- Validate space type\\\\n  IF NEW.type = 'space' AND NOT EXISTS (\\\\n    SELECT 1 FROM space_tags WHERE space_id = NEW.id AND tag = 'space'\\\\n  ) THEN\\\\n    INSERT INTO space_tags (space_id, tag) VALUES (NEW.id, 'space')","\\\\n  END IF","\\\\n  \\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Drop existing trigger if it exists\\\\nDROP TRIGGER IF EXISTS ensure_space_type ON spaces","\\\\n\\\\n-- Create new trigger\\\\nCREATE TRIGGER ensure_space_type\\\\n  AFTER INSERT OR UPDATE ON spaces\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION validate_space_type()",""}	young_mountain
0021	{"\\\\n\\\\n-- Drop existing models table if it exists\\\\nDROP TABLE IF EXISTS models","\\\\n\\\\n-- Create new models table with same structure as spaces\\\\nCREATE TABLE models (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  created_at timestamptz DEFAULT now(),\\\\n  title text NOT NULL,\\\\n  description text NOT NULL,\\\\n  author_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,\\\\n  thumbnail_url text NOT NULL,\\\\n  framework text NOT NULL,\\\\n  likes_count integer DEFAULT 0,\\\\n  forks_count integer DEFAULT 0,\\\\n  views_count integer DEFAULT 0,\\\\n  is_featured boolean DEFAULT false,\\\\n  is_private boolean DEFAULT false,\\\\n  type text NOT NULL DEFAULT 'model' CHECK (type = 'model')\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE models ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create RLS policies\\\\nCREATE POLICY \\"Public models are viewable by everyone\\"\\\\n  ON models FOR SELECT\\\\n  USING (NOT is_private OR auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can create their own models\\"\\\\n  ON models FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can update their own models\\"\\\\n  ON models FOR UPDATE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can delete their own models\\"\\\\n  ON models FOR DELETE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\n-- Create indexes for better performance\\\\nCREATE INDEX idx_models_author_id ON models(author_id)","\\\\nCREATE INDEX idx_models_created_at ON models(created_at DESC)","\\\\nCREATE INDEX idx_models_framework ON models(framework)","\\\\nCREATE INDEX idx_models_featured ON models(is_featured) WHERE is_featured = true","\\\\nCREATE INDEX idx_models_privacy ON models(is_private, author_id)","\\\\n\\\\n-- Create updated_at trigger\\\\nCREATE TRIGGER update_models_updated_at\\\\n  BEFORE UPDATE ON models\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()","\\\\n\\\\n-- Transfer data from spaces to models\\\\nINSERT INTO models (\\\\n  title,\\\\n  description,\\\\n  author_id,\\\\n  thumbnail_url,\\\\n  framework,\\\\n  likes_count,\\\\n  forks_count,\\\\n  views_count,\\\\n  is_featured,\\\\n  is_private,\\\\n  created_at\\\\n)\\\\nSELECT \\\\n  title,\\\\n  description,\\\\n  author_id,\\\\n  thumbnail_url,\\\\n  framework,\\\\n  likes_count,\\\\n  forks_count,\\\\n  views_count,\\\\n  is_featured,\\\\n  is_private,\\\\n  created_at\\\\nFROM spaces\\\\nWHERE type = 'model'",""}	bold_garden
0022	{"\\\\n\\\\n-- First, transfer the data from spaces to models\\\\nINSERT INTO models (\\\\n  title,\\\\n  description,\\\\n  author_id,\\\\n  thumbnail_url,\\\\n  framework,\\\\n  likes_count,\\\\n  forks_count,\\\\n  views_count,\\\\n  is_featured,\\\\n  is_private,\\\\n  created_at\\\\n)\\\\nSELECT \\\\n  title,\\\\n  description,\\\\n  author_id,\\\\n  thumbnail_url,\\\\n  framework,\\\\n  likes_count,\\\\n  forks_count,\\\\n  views_count,\\\\n  is_featured,\\\\n  is_private,\\\\n  created_at\\\\nFROM spaces\\\\nWHERE type = 'model'","\\\\n\\\\n-- Create a temporary table to store the mapping between old and new IDs\\\\nCREATE TEMP TABLE model_id_mapping AS\\\\nSELECT \\\\n  s.id as old_id,\\\\n  m.id as new_id\\\\nFROM spaces s\\\\nJOIN models m ON \\\\n  s.title = m.title AND \\\\n  s.author_id = m.author_id AND \\\\n  s.created_at = m.created_at\\\\nWHERE s.type = 'model'","\\\\n\\\\n-- Transfer tags to new model_tags table\\\\nCREATE TABLE IF NOT EXISTS model_tags (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  model_id uuid REFERENCES models(id) ON DELETE CASCADE,\\\\n  tag text NOT NULL,\\\\n  UNIQUE(model_id, tag)\\\\n)","\\\\n\\\\n-- Enable RLS on model_tags\\\\nALTER TABLE model_tags ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create RLS policies for model_tags\\\\nCREATE POLICY \\"Model tags are viewable by everyone\\"\\\\n  ON model_tags FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM models\\\\n      WHERE id = model_tags.model_id\\\\n      AND (NOT is_private OR author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage tags for own models\\"\\\\n  ON model_tags\\\\n  FOR ALL\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM models\\\\n      WHERE id = model_tags.model_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Copy tags to new table\\\\nINSERT INTO model_tags (model_id, tag)\\\\nSELECT \\\\n  m.new_id,\\\\n  st.tag\\\\nFROM space_tags st\\\\nJOIN model_id_mapping m ON st.space_id = m.old_id\\\\nWHERE st.tag != 'model'","\\\\n\\\\n-- Delete the original spaces that were migrated\\\\nDELETE FROM spaces \\\\nWHERE type = 'model'","\\\\n\\\\n-- Create indexes for model_tags\\\\nCREATE INDEX idx_model_tags_model_id ON model_tags(model_id)","\\\\nCREATE INDEX idx_model_tags_tag ON model_tags(tag)","\\\\n\\\\n-- Clean up\\\\nDROP TABLE model_id_mapping",""}	sweet_lab
0023	{"\\\\n\\\\n-- First, transfer the data from spaces to models\\\\nINSERT INTO models (\\\\n  title,\\\\n  description,\\\\n  author_id,\\\\n  thumbnail_url,\\\\n  framework,\\\\n  likes_count,\\\\n  forks_count,\\\\n  views_count,\\\\n  is_featured,\\\\n  is_private,\\\\n  created_at\\\\n)\\\\nSELECT \\\\n  title,\\\\n  description,\\\\n  author_id,\\\\n  thumbnail_url,\\\\n  COALESCE(\\\\n    (SELECT tag FROM space_tags \\\\n     WHERE space_id = spaces.id \\\\n     AND tag IN ('pytorch', 'tensorflow', 'jax', 'scikit-learn')\\\\n     LIMIT 1\\\\n    ),\\\\n    'custom'\\\\n  ) as framework,\\\\n  likes_count,\\\\n  forks_count,\\\\n  views_count,\\\\n  is_featured,\\\\n  is_private,\\\\n  created_at\\\\nFROM spaces\\\\nWHERE type = 'model'","\\\\n\\\\n-- Create a temporary table to store the mapping between old and new IDs\\\\nCREATE TEMP TABLE model_id_mapping AS\\\\nSELECT \\\\n  s.id as old_id,\\\\n  m.id as new_id\\\\nFROM spaces s\\\\nJOIN models m ON \\\\n  s.title = m.title AND \\\\n  s.author_id = m.author_id AND \\\\n  s.created_at = m.created_at\\\\nWHERE s.type = 'model'","\\\\n\\\\n-- Copy tags to model_tags table\\\\nINSERT INTO model_tags (model_id, tag)\\\\nSELECT \\\\n  m.new_id,\\\\n  st.tag\\\\nFROM space_tags st\\\\nJOIN model_id_mapping m ON st.space_id = m.old_id\\\\nWHERE st.tag != 'model'","\\\\n\\\\n-- Delete the original spaces that were migrated\\\\nDELETE FROM spaces \\\\nWHERE type = 'model'","\\\\n\\\\n-- Clean up\\\\nDROP TABLE model_id_mapping",""}	snowy_beacon
0024	{"\\\\n\\\\n-- Create temporary table for models to keep\\\\nWITH RankedModels AS (\\\\n  SELECT \\\\n    id,\\\\n    title,\\\\n    author_id,\\\\n    created_at,\\\\n    likes_count + forks_count + views_count as engagement,\\\\n    ROW_NUMBER() OVER (\\\\n      PARTITION BY title, author_id\\\\n      ORDER BY \\\\n        likes_count + forks_count + views_count DESC,\\\\n        created_at DESC\\\\n    ) as rn\\\\n  FROM models\\\\n)\\\\nSELECT id INTO TEMP TABLE models_to_keep\\\\nFROM RankedModels\\\\nWHERE rn = 1","\\\\n\\\\n-- Create mapping for duplicate IDs\\\\nWITH DuplicateGroups AS (\\\\n  SELECT \\\\n    m1.id as keeper_id,\\\\n    m2.id as duplicate_id\\\\n  FROM models m1\\\\n  JOIN models m2 ON \\\\n    m1.title = m2.title AND \\\\n    m1.author_id = m2.author_id AND\\\\n    m1.id != m2.id\\\\n  JOIN models_to_keep mk ON m1.id = mk.id\\\\n)\\\\nSELECT * INTO TEMP TABLE model_id_mapping\\\\nFROM DuplicateGroups","\\\\n\\\\n-- Create temporary table for unique tags\\\\nCREATE TEMP TABLE unique_model_tags AS\\\\nSELECT DISTINCT ON (keeper_id, tag) \\\\n  m.keeper_id as model_id,\\\\n  mt.tag\\\\nFROM model_id_mapping m\\\\nJOIN model_tags mt ON mt.model_id IN (m.keeper_id, m.duplicate_id)","\\\\n\\\\n-- Delete all affected tags\\\\nDELETE FROM model_tags mt\\\\nWHERE EXISTS (\\\\n  SELECT 1 FROM model_id_mapping m\\\\n  WHERE mt.model_id IN (m.keeper_id, m.duplicate_id)\\\\n)","\\\\n\\\\n-- Reinsert unique tags\\\\nINSERT INTO model_tags (model_id, tag)\\\\nSELECT model_id, tag\\\\nFROM unique_model_tags","\\\\n\\\\n-- Remove duplicates\\\\nDELETE FROM models m\\\\nWHERE NOT EXISTS (\\\\n  SELECT 1 FROM models_to_keep mk\\\\n  WHERE mk.id = m.id\\\\n)","\\\\n\\\\n-- Add unique constraint\\\\nALTER TABLE models\\\\nADD CONSTRAINT unique_model_per_author \\\\nUNIQUE (title, author_id)","\\\\n\\\\n-- Clean up\\\\nDROP TABLE models_to_keep","\\\\nDROP TABLE model_id_mapping","\\\\nDROP TABLE unique_model_tags",""}	odd_lodge
0025	{"\\\\n\\\\n-- Drop existing policies if they exist\\\\nDROP POLICY IF EXISTS \\"Models are viewable by everyone\\" ON models","\\\\nDROP POLICY IF EXISTS \\"Users can create their own models\\" ON models","\\\\nDROP POLICY IF EXISTS \\"Users can update their own models\\" ON models","\\\\nDROP POLICY IF EXISTS \\"Users can delete their own models\\" ON models","\\\\nDROP POLICY IF EXISTS \\"Model tags are viewable by everyone\\" ON model_tags","\\\\nDROP POLICY IF EXISTS \\"Users can manage tags for own models\\" ON model_tags","\\\\n\\\\n-- Create models table if not exists\\\\nCREATE TABLE IF NOT EXISTS models (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  title text NOT NULL,\\\\n  description text NOT NULL,\\\\n  author_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,\\\\n  thumbnail_url text NOT NULL,\\\\n  framework text NOT NULL,\\\\n  task text,\\\\n  language text,\\\\n  likes_count integer DEFAULT 0,\\\\n  forks_count integer DEFAULT 0,\\\\n  views_count integer DEFAULT 0,\\\\n  is_featured boolean DEFAULT false,\\\\n  created_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Create model_tags table if not exists\\\\nCREATE TABLE IF NOT EXISTS model_tags (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  model_id uuid REFERENCES models(id) ON DELETE CASCADE,\\\\n  tag text NOT NULL,\\\\n  UNIQUE(model_id, tag)\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE models ENABLE ROW LEVEL SECURITY","\\\\nALTER TABLE model_tags ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create new RLS policies for models\\\\nCREATE POLICY \\"Models are viewable by everyone\\"\\\\n  ON models FOR SELECT\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Users can create their own models\\"\\\\n  ON models FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can update their own models\\"\\\\n  ON models FOR UPDATE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can delete their own models\\"\\\\n  ON models FOR DELETE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\n-- Create new RLS policies for model_tags\\\\nCREATE POLICY \\"Model tags are viewable by everyone\\"\\\\n  ON model_tags FOR SELECT\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Users can manage tags for own models\\"\\\\n  ON model_tags\\\\n  FOR ALL\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM models\\\\n      WHERE id = model_tags.model_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create indexes\\\\nCREATE INDEX IF NOT EXISTS idx_models_author_id ON models(author_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_models_created_at ON models(created_at DESC)","\\\\nCREATE INDEX IF NOT EXISTS idx_models_framework ON models(framework)","\\\\nCREATE INDEX IF NOT EXISTS idx_models_featured ON models(is_featured) WHERE is_featured = true","\\\\n\\\\nCREATE INDEX IF NOT EXISTS idx_model_tags_model_id ON model_tags(model_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_model_tags_tag ON model_tags(tag)",""}	quiet_mud
0026	{"\\\\n\\\\n-- Create datasets table if it doesn't exist\\\\nCREATE TABLE IF NOT EXISTS datasets (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  title text NOT NULL,\\\\n  description text NOT NULL,\\\\n  author_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,\\\\n  thumbnail_url text NOT NULL,\\\\n  type text NOT NULL,\\\\n  format text NOT NULL,\\\\n  size text NOT NULL,\\\\n  likes_count integer DEFAULT 0,\\\\n  forks_count integer DEFAULT 0,\\\\n  views_count integer DEFAULT 0,\\\\n  is_featured boolean DEFAULT false,\\\\n  created_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Create dataset_tags table if it doesn't exist\\\\nCREATE TABLE IF NOT EXISTS dataset_tags (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  dataset_id uuid REFERENCES datasets(id) ON DELETE CASCADE,\\\\n  tag text NOT NULL,\\\\n  UNIQUE(dataset_id, tag)\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE datasets ENABLE ROW LEVEL SECURITY","\\\\nALTER TABLE dataset_tags ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create RLS policies for datasets\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Datasets are viewable by everyone\\" ON datasets","\\\\n  DROP POLICY IF EXISTS \\"Users can create their own datasets\\" ON datasets","\\\\n  DROP POLICY IF EXISTS \\"Users can update their own datasets\\" ON datasets","\\\\n  DROP POLICY IF EXISTS \\"Users can delete their own datasets\\" ON datasets","\\\\nEXCEPTION\\\\n  WHEN undefined_object THEN NULL","\\\\nEND $$","\\\\n\\\\nCREATE POLICY \\"Datasets are viewable by everyone\\"\\\\n  ON datasets FOR SELECT\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Users can create their own datasets\\"\\\\n  ON datasets FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can update their own datasets\\"\\\\n  ON datasets FOR UPDATE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can delete their own datasets\\"\\\\n  ON datasets FOR DELETE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\n-- Create RLS policies for dataset_tags\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Dataset tags are viewable by everyone\\" ON dataset_tags","\\\\n  DROP POLICY IF EXISTS \\"Users can manage tags for own datasets\\" ON dataset_tags","\\\\nEXCEPTION\\\\n  WHEN undefined_object THEN NULL","\\\\nEND $$","\\\\n\\\\nCREATE POLICY \\"Dataset tags are viewable by everyone\\"\\\\n  ON dataset_tags FOR SELECT\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Users can manage tags for own datasets\\"\\\\n  ON dataset_tags\\\\n  FOR ALL\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM datasets\\\\n      WHERE id = dataset_tags.dataset_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create indexes\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_author_id ON datasets(author_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_created_at ON datasets(created_at DESC)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_type ON datasets(type)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_format ON datasets(format)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_featured ON datasets(is_featured) WHERE is_featured = true","\\\\n\\\\nCREATE INDEX IF NOT EXISTS idx_dataset_tags_dataset_id ON dataset_tags(dataset_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_dataset_tags_tag ON dataset_tags(tag)","\\\\n\\\\n-- Migrate existing dataset data from spaces\\\\nWITH migrated_datasets AS (\\\\n  INSERT INTO datasets (\\\\n    title,\\\\n    description,\\\\n    author_id,\\\\n    thumbnail_url,\\\\n    type,\\\\n    format,\\\\n    size,\\\\n    likes_count,\\\\n    forks_count,\\\\n    views_count,\\\\n    is_featured,\\\\n    created_at\\\\n  )\\\\n  SELECT \\\\n    s.title,\\\\n    s.description,\\\\n    s.author_id,\\\\n    s.thumbnail_url,\\\\n    COALESCE(\\\\n      (SELECT tag FROM space_tags \\\\n       WHERE space_id = s.id \\\\n       AND tag IN ('tabular', 'image', 'text', 'audio', 'video')\\\\n       LIMIT 1\\\\n      ),\\\\n      'other'\\\\n    ) as type,\\\\n    COALESCE(\\\\n      (SELECT tag FROM space_tags \\\\n       WHERE space_id = s.id \\\\n       AND tag IN ('csv', 'json', 'parquet', 'arrow')\\\\n       LIMIT 1\\\\n      ),\\\\n      'custom'\\\\n    ) as format,\\\\n    COALESCE(\\\\n      (SELECT tag FROM space_tags \\\\n       WHERE space_id = s.id \\\\n       AND tag LIKE 'size:%'\\\\n       LIMIT 1\\\\n      ),\\\\n      'size:unknown'\\\\n    ) as size,\\\\n    s.likes_count,\\\\n    s.forks_count,\\\\n    s.views_count,\\\\n    s.is_featured,\\\\n    s.created_at\\\\n  FROM spaces s\\\\n  WHERE s.type = 'dataset'\\\\n  RETURNING id, title, author_id, created_at\\\\n)\\\\nINSERT INTO dataset_tags (dataset_id, tag)\\\\nSELECT \\\\n  md.id,\\\\n  st.tag\\\\nFROM migrated_datasets md\\\\nJOIN spaces s ON \\\\n  s.title = md.title AND \\\\n  s.author_id = md.author_id AND \\\\n  s.created_at = md.created_at\\\\nJOIN space_tags st ON st.space_id = s.id\\\\nWHERE st.tag != 'dataset'",""}	lingering_hat
0027	{"\\\\n\\\\n-- Add is_private column to datasets if it doesn't exist\\\\nALTER TABLE datasets \\\\nADD COLUMN IF NOT EXISTS is_private boolean DEFAULT false","\\\\n\\\\n-- Create dataset_tags table if it doesn't exist\\\\nCREATE TABLE IF NOT EXISTS dataset_tags (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  dataset_id uuid REFERENCES datasets(id) ON DELETE CASCADE,\\\\n  tag text NOT NULL,\\\\n  UNIQUE(dataset_id, tag)\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE datasets ENABLE ROW LEVEL SECURITY","\\\\nALTER TABLE dataset_tags ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Datasets are viewable by everyone\\" ON datasets","\\\\nDROP POLICY IF EXISTS \\"Users can create their own datasets\\" ON datasets","\\\\nDROP POLICY IF EXISTS \\"Users can update their own datasets\\" ON datasets","\\\\nDROP POLICY IF EXISTS \\"Users can delete their own datasets\\" ON datasets","\\\\nDROP POLICY IF EXISTS \\"Dataset tags are viewable by everyone\\" ON dataset_tags","\\\\nDROP POLICY IF EXISTS \\"Users can manage tags for own datasets\\" ON dataset_tags","\\\\n\\\\n-- Create new RLS policies for datasets\\\\nCREATE POLICY \\"Public datasets are viewable by everyone\\"\\\\n  ON datasets FOR SELECT\\\\n  USING (NOT is_private OR auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can create their own datasets\\"\\\\n  ON datasets FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can update their own datasets\\"\\\\n  ON datasets FOR UPDATE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\nCREATE POLICY \\"Users can delete their own datasets\\"\\\\n  ON datasets FOR DELETE\\\\n  TO authenticated\\\\n  USING (auth.uid() = author_id)","\\\\n\\\\n-- Create new RLS policies for dataset_tags\\\\nCREATE POLICY \\"Dataset tags are viewable with dataset\\"\\\\n  ON dataset_tags FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM datasets\\\\n      WHERE id = dataset_tags.dataset_id\\\\n      AND (NOT is_private OR author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage tags for own datasets\\"\\\\n  ON dataset_tags FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM datasets\\\\n      WHERE id = dataset_tags.dataset_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_privacy ON datasets(is_private, author_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_public ON datasets(created_at DESC) WHERE NOT is_private","\\\\nCREATE INDEX IF NOT EXISTS idx_dataset_tags_dataset ON dataset_tags(dataset_id)","\\\\nCREATE INDEX IF NOT EXISTS idx_dataset_tags_tag ON dataset_tags(tag)",""}	turquoise_meadow
0034	{"\\\\n\\\\n-- Update file size validation in storage policies\\\\nDO $$ \\\\nBEGIN\\\\n  -- Drop existing policies\\\\n  DROP POLICY IF EXISTS \\"Users can upload their model files\\" ON storage.objects","\\\\n\\\\n  -- Recreate policy with new size limit\\\\n  CREATE POLICY \\"Users can upload their model files\\"\\\\n    ON storage.objects FOR INSERT\\\\n    TO authenticated\\\\n    WITH CHECK (\\\\n      bucket_id = 'model-files' AND\\\\n      storage.validate_model_file_path(name) AND\\\\n      auth.uid()::text = split_part(name, '/', 1) AND\\\\n      EXISTS (\\\\n        SELECT 1 FROM models m\\\\n        WHERE m.id::text = split_part(name, '/', 3)\\\\n        AND m.author_id = auth.uid()\\\\n      ) AND\\\\n      octet_length(DECODE(SUBSTRING(name FROM '[^.]+$'), 'escape')) <= 524288000 -- 500MB max\\\\n    )","\\\\nEND $$",""}	amber_prism
0028	{"\\\\n\\\\n-- Create model-files bucket if it doesn't exist\\\\nINSERT INTO storage.buckets (id, name, public)\\\\nVALUES ('model-files', 'model-files', false)\\\\nON CONFLICT (id) DO NOTHING","\\\\n\\\\n-- Enable RLS on storage.objects\\\\nALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create function to extract model ID from storage path\\\\nCREATE OR REPLACE FUNCTION storage.extract_model_id(path text)\\\\nRETURNS text AS $$\\\\nBEGIN\\\\n  -- Extract first path segment (model ID)\\\\n  RETURN split_part(path, '/', 1)","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create policies for model files\\\\nCREATE POLICY \\"Model files are viewable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = storage.extract_model_id(name)\\\\n      AND NOT m.is_private\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage their own model files\\"\\\\n  ON storage.objects\\\\n  FOR ALL\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = storage.extract_model_id(name)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )",""}	floral_harbor
0029	{"\\\\n\\\\n-- Create model-files bucket if it doesn't exist\\\\nDO $$ \\\\nBEGIN\\\\n  INSERT INTO storage.buckets (id, name, public)\\\\n  VALUES ('model-files', 'model-files', false)\\\\n  ON CONFLICT (id) DO NOTHING","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Enable RLS on storage.objects if not already enabled\\\\nALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Model files are viewable by everyone\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can upload model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can update model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can delete model files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create new policies with safer path handling\\\\nCREATE POLICY \\"Model files are viewable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND NOT m.is_private\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can upload model files\\"\\\\n  ON storage.objects FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    bucket_id = 'model-files' AND\\\\n    auth.uid()::text = split_part(name, '/', 2) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can update model files\\"\\\\n  ON storage.objects FOR UPDATE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    auth.uid()::text = split_part(name, '/', 2) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can delete model files\\"\\\\n  ON storage.objects FOR DELETE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    auth.uid()::text = split_part(name, '/', 2) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )",""}	sunny_lodge
0030	{"-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Model files are viewable by everyone\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can upload model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can update model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can delete model files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create simpler, more reliable policies\\\\nCREATE POLICY \\"Model files are viewable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    NOT EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND m.is_private = true\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage their own model files\\"\\\\n  ON storage.objects\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    auth.uid()::text = split_part(name, '/', 2) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )",""}	billowing_unit
0031	{"-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Model files are viewable by everyone\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can manage their own model files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create bucket if it doesn't exist\\\\nDO $$ \\\\nBEGIN\\\\n  INSERT INTO storage.buckets (id, name, public)\\\\n  VALUES ('model-files', 'model-files', false)\\\\n  ON CONFLICT (id) DO NOTHING","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create simplified policies\\\\nCREATE POLICY \\"Anyone can read public model files\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    NOT EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND m.is_private = true\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Owners can manage their model files\\"\\\\n  ON storage.objects\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 4)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )",""}	small_grove
0032	{"-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Anyone can read public model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Owners can manage their model files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create bucket if it doesn't exist\\\\nDO $$ \\\\nBEGIN\\\\n  INSERT INTO storage.buckets (id, name, public)\\\\n  VALUES ('model-files', 'model-files', false)\\\\n  ON CONFLICT (id) DO NOTHING","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create more permissive policies for model files\\\\nCREATE POLICY \\"Model files are readable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files'\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Authenticated users can upload model files\\"\\\\n  ON storage.objects\\\\n  FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    bucket_id = 'model-files'\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Authenticated users can update their files\\"\\\\n  ON storage.objects\\\\n  FOR UPDATE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files'\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Authenticated users can delete their files\\"\\\\n  ON storage.objects\\\\n  FOR DELETE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files'\\\\n  )","\\\\n\\\\n-- Create index for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_storage_model_files\\\\n  ON storage.objects (name)\\\\n  WHERE bucket_id = 'model-files'",""}	light_term
0033	{"\\\\n\\\\n-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Model files are readable by everyone\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Authenticated users can upload model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Authenticated users can update their files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Authenticated users can delete their files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create function to validate storage path structure\\\\nCREATE OR REPLACE FUNCTION storage.validate_model_file_path(path text)\\\\nRETURNS boolean AS $$\\\\nDECLARE\\\\n  path_parts text[]","\\\\nBEGIN\\\\n  -- Split path into parts\\\\n  path_parts := string_to_array(path, '/')","\\\\n  \\\\n  -- Validate path has exactly 4 parts: userId/models/modelId/filename\\\\n  IF array_length(path_parts, 1) < 4 THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate second part is 'models'\\\\n  IF path_parts[2] != 'models' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate filename exists\\\\n  IF path_parts[4] IS NULL OR path_parts[4] = '' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create policies with proper validation\\\\nCREATE POLICY \\"Model files are readable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    NOT EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.is_private = true\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can upload their model files\\"\\\\n  ON storage.objects FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    auth.uid()::text = split_part(name, '/', 1) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    ) AND\\\\n    octet_length(DECODE(SUBSTRING(name FROM '[^.]+$'), 'escape')) <= 10485760 -- 10MB max\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can update their model files\\"\\\\n  ON storage.objects FOR UPDATE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    auth.uid()::text = split_part(name, '/', 1) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can delete their model files\\"\\\\n  ON storage.objects FOR DELETE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    auth.uid()::text = split_part(name, '/', 1) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create index for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_storage_model_files\\\\n  ON storage.objects (name)\\\\n  WHERE bucket_id = 'model-files'",""}	shrill_cell
0035	{"-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Model files are readable by everyone\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can upload their model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can update their model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can delete their model files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create function to validate storage path structure\\\\nCREATE OR REPLACE FUNCTION storage.validate_model_file_path(path text)\\\\nRETURNS boolean AS $$\\\\nDECLARE\\\\n  path_parts text[]","\\\\nBEGIN\\\\n  -- Split path into parts\\\\n  path_parts := string_to_array(path, '/')","\\\\n  \\\\n  -- Validate path has exactly 4 parts: userId/models/modelId/filename\\\\n  IF array_length(path_parts, 1) != 4 THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate second part is 'models'\\\\n  IF path_parts[2] != 'models' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate filename exists and is not empty\\\\n  IF path_parts[4] IS NULL OR path_parts[4] = '' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate modelId exists and is a valid UUID\\\\n  IF path_parts[3] !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create policies with proper validation\\\\nCREATE POLICY \\"Model files are readable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    NOT EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.is_private = true\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can upload their model files\\"\\\\n  ON storage.objects FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    auth.uid()::text = split_part(name, '/', 1) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can update their model files\\"\\\\n  ON storage.objects FOR UPDATE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    auth.uid()::text = split_part(name, '/', 1) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can delete their model files\\"\\\\n  ON storage.objects FOR DELETE\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    auth.uid()::text = split_part(name, '/', 1) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create index for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_storage_model_files\\\\n  ON storage.objects (name)\\\\n  WHERE bucket_id = 'model-files'",""}	humble_art
0036	{"\\\\n\\\\n-- Temporarily drop triggers\\\\nDROP TRIGGER IF EXISTS update_models_updated_at ON models","\\\\nDROP TRIGGER IF EXISTS update_datasets_updated_at ON datasets","\\\\n\\\\n-- Add isOwner column to spaces\\\\nALTER TABLE spaces\\\\nADD COLUMN IF NOT EXISTS is_owner boolean DEFAULT true","\\\\n\\\\n-- Add isOwner column to models \\\\nALTER TABLE models\\\\nADD COLUMN IF NOT EXISTS is_owner boolean DEFAULT true","\\\\n\\\\n-- Add isOwner column to datasets\\\\nALTER TABLE datasets\\\\nADD COLUMN IF NOT EXISTS is_owner boolean DEFAULT true","\\\\n\\\\n-- Update existing content to set isOwner to true\\\\nUPDATE spaces SET is_owner = true","\\\\nUPDATE models SET is_owner = true","\\\\nUPDATE datasets SET is_owner = true","\\\\n\\\\n-- Create indexes for better query performance\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_is_owner ON spaces(is_owner) WHERE is_owner = true","\\\\nCREATE INDEX IF NOT EXISTS idx_models_is_owner ON models(is_owner) WHERE is_owner = true","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_is_owner ON datasets(is_owner) WHERE is_owner = true","\\\\n\\\\n-- Recreate triggers\\\\nCREATE TRIGGER update_models_updated_at\\\\n  BEFORE UPDATE ON models\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()","\\\\n\\\\nCREATE TRIGGER update_datasets_updated_at\\\\n  BEFORE UPDATE ON datasets\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()",""}	shrill_bush
0037	{"\\\\n\\\\n-- Add updated_at columns\\\\nALTER TABLE spaces \\\\nADD COLUMN IF NOT EXISTS updated_at timestamptz DEFAULT now()","\\\\n\\\\nALTER TABLE models \\\\nADD COLUMN IF NOT EXISTS updated_at timestamptz DEFAULT now()","\\\\n\\\\nALTER TABLE datasets \\\\nADD COLUMN IF NOT EXISTS updated_at timestamptz DEFAULT now()","\\\\n\\\\n-- Create or replace trigger function\\\\nCREATE OR REPLACE FUNCTION update_updated_at_column()\\\\nRETURNS TRIGGER AS $$\\\\nBEGIN\\\\n  NEW.updated_at = now()","\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create triggers for each table\\\\nDROP TRIGGER IF EXISTS update_spaces_updated_at ON spaces","\\\\nCREATE TRIGGER update_spaces_updated_at\\\\n  BEFORE UPDATE ON spaces\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()","\\\\n\\\\nDROP TRIGGER IF EXISTS update_models_updated_at ON models","\\\\nCREATE TRIGGER update_models_updated_at\\\\n  BEFORE UPDATE ON models\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()","\\\\n\\\\nDROP TRIGGER IF EXISTS update_datasets_updated_at ON datasets","\\\\nCREATE TRIGGER update_datasets_updated_at\\\\n  BEFORE UPDATE ON datasets\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at_column()","\\\\n\\\\n-- Create indexes for better query performance\\\\nCREATE INDEX IF NOT EXISTS idx_spaces_updated_at ON spaces(updated_at DESC)","\\\\nCREATE INDEX IF NOT EXISTS idx_models_updated_at ON models(updated_at DESC)","\\\\nCREATE INDEX IF NOT EXISTS idx_datasets_updated_at ON datasets(updated_at DESC)",""}	gentle_cherry
0038	{"\\\\n\\\\n-- Create model_commits table\\\\nCREATE TABLE model_commits (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  model_id uuid NOT NULL REFERENCES models(id) ON DELETE CASCADE,\\\\n  author_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,\\\\n  message text NOT NULL,\\\\n  created_at timestamptz DEFAULT now(),\\\\n  files text[] NOT NULL DEFAULT '{}',\\\\n  hash text NOT NULL,\\\\n  CONSTRAINT valid_hash CHECK (hash ~ '^[0-9a-f]{40}$')\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE model_commits ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create policies\\\\nCREATE POLICY \\"Model commits are viewable by everyone\\"\\\\n  ON model_commits FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM models\\\\n      WHERE id = model_id\\\\n      AND (NOT is_private OR author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can create commits for their models\\"\\\\n  ON model_commits FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    EXISTS (\\\\n      SELECT 1 FROM models\\\\n      WHERE id = model_id\\\\n      AND author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create indexes\\\\nCREATE INDEX idx_model_commits_model_id ON model_commits(model_id)","\\\\nCREATE INDEX idx_model_commits_created_at ON model_commits(created_at DESC)","\\\\nCREATE INDEX idx_model_commits_author_id ON model_commits(author_id)","\\\\nCREATE INDEX idx_model_commits_hash ON model_commits(hash)",""}	dry_bush
0039	{"-- Create model_file_changes table to track specific file changes\\\\nCREATE TABLE model_file_changes (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  commit_id uuid NOT NULL REFERENCES model_commits(id) ON DELETE CASCADE,\\\\n  file_path text NOT NULL,\\\\n  change_type text NOT NULL CHECK (change_type IN ('added', 'modified', 'deleted')),\\\\n  created_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE model_file_changes ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Create policies\\\\nCREATE POLICY \\"Model file changes are viewable by everyone\\"\\\\n  ON model_file_changes FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\n-- Create indexes\\\\nCREATE INDEX idx_model_file_changes_commit_id ON model_file_changes(commit_id)","\\\\nCREATE INDEX idx_model_file_changes_file_path ON model_file_changes(file_path)",""}	tender_truth
0050	{"-- Add updated_at column to profiles table\\\\nALTER TABLE profiles\\\\nADD COLUMN IF NOT EXISTS updated_at timestamptz DEFAULT now()","\\\\n\\\\n-- Create or replace trigger function for updating updated_at\\\\nCREATE OR REPLACE FUNCTION update_profile_updated_at()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  NEW.updated_at = now()","\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger for automatically updating updated_at\\\\nDROP TRIGGER IF EXISTS update_profile_updated_at_trigger ON profiles","\\\\nCREATE TRIGGER update_profile_updated_at_trigger\\\\n  BEFORE UPDATE ON profiles\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_profile_updated_at()","\\\\n\\\\n-- Create index for better query performance\\\\nCREATE INDEX IF NOT EXISTS idx_profiles_updated_at \\\\nON profiles(updated_at DESC)",""}	bronze_manor
0040	{"-- Drop existing policy\\\\nDROP POLICY IF EXISTS \\"Model file changes are viewable by everyone\\" ON model_file_changes","\\\\n\\\\n-- Create new policies\\\\nCREATE POLICY \\"Model file changes are viewable by everyone\\"\\\\n  ON model_file_changes FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can insert file changes for their commits\\"\\\\n  ON model_file_changes FOR INSERT\\\\n  TO authenticated\\\\n  WITH CHECK (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create function to validate file changes\\\\nCREATE OR REPLACE FUNCTION validate_file_changes()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Ensure file path is not empty\\\\n  IF NEW.file_path IS NULL OR NEW.file_path = '' THEN\\\\n    RAISE EXCEPTION 'File path cannot be empty'","\\\\n  END IF","\\\\n\\\\n  -- Ensure change type is valid\\\\n  IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN\\\\n    RAISE EXCEPTION 'Invalid change type'","\\\\n  END IF","\\\\n\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger for validation\\\\nDROP TRIGGER IF EXISTS validate_file_changes_trigger ON model_file_changes","\\\\nCREATE TRIGGER validate_file_changes_trigger\\\\n  BEFORE INSERT OR UPDATE ON model_file_changes\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION validate_file_changes()",""}	rough_shape
0041	{"-- Drop existing policy\\\\nDROP POLICY IF EXISTS \\"Model commits are viewable by everyone\\" ON model_commits","\\\\n\\\\n-- Create new policies with better access control\\\\nCREATE POLICY \\"Model commits are viewable by everyone\\"\\\\n  ON model_commits FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id = model_id\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\n-- Add retry function for database operations\\\\nCREATE OR REPLACE FUNCTION retry_operation(\\\\n  max_attempts integer,\\\\n  operation_name text,\\\\n  VARIADIC args text[]\\\\n)\\\\nRETURNS void AS $$\\\\nDECLARE\\\\n  attempt integer := 1","\\\\n  success boolean := false","\\\\nBEGIN\\\\n  WHILE attempt <= max_attempts AND NOT success LOOP\\\\n    BEGIN\\\\n      -- Log attempt\\\\n      RAISE NOTICE 'Attempt % of % for operation %', attempt, max_attempts, operation_name","\\\\n      \\\\n      -- Execute operation based on args\\\\n      EXECUTE format(operation_name, VARIADIC args)","\\\\n      \\\\n      success := true","\\\\n    EXCEPTION WHEN OTHERS THEN\\\\n      IF attempt = max_attempts THEN\\\\n        RAISE","\\\\n      END IF","\\\\n      -- Wait with exponential backoff\\\\n      PERFORM pg_sleep(power(2, attempt - 1))","\\\\n      attempt := attempt + 1","\\\\n    END","\\\\n  END LOOP","\\\\nEND","\\\\n$$ LANGUAGE plpgsql",""}	gentle_summit
0042	{"-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Model file changes are viewable by everyone\\" ON model_file_changes","\\\\nDROP POLICY IF EXISTS \\"Users can insert file changes for their commits\\" ON model_file_changes","\\\\n\\\\n-- Create new policies with improved access control\\\\nCREATE POLICY \\"Anyone can view file changes\\"\\\\n  ON model_file_changes FOR SELECT\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Model owners can manage file changes\\"\\\\n  ON model_file_changes\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Add indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_model_file_changes_lookup \\\\nON model_file_changes(commit_id, file_path)","\\\\n\\\\n-- Add function to handle file change errors\\\\nCREATE OR REPLACE FUNCTION handle_file_change_error()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  BEGIN\\\\n    -- Validate file path\\\\n    IF NEW.file_path IS NULL OR NEW.file_path = '' THEN\\\\n      RAISE EXCEPTION 'Invalid file path'","\\\\n    END IF","\\\\n\\\\n    -- Validate change type\\\\n    IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN\\\\n      RAISE EXCEPTION 'Invalid change type'","\\\\n    END IF","\\\\n\\\\n    RETURN NEW","\\\\n  EXCEPTION WHEN OTHERS THEN\\\\n    -- Log error and return NULL to prevent insert\\\\n    RAISE WARNING 'Error in file change: %', SQLERRM","\\\\n    RETURN NULL","\\\\n  END","\\\\nEND","\\\\n$$ LANGUAGE plpgsql",""}	snowy_silence
0043	{"\\\\n\\\\n-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Anyone can view file changes\\" ON model_file_changes","\\\\nDROP POLICY IF EXISTS \\"Model owners can manage file changes\\" ON model_file_changes","\\\\n\\\\n-- Create simplified policies\\\\nCREATE POLICY \\"Model file changes are viewable by everyone\\"\\\\n  ON model_file_changes FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage their own model file changes\\"\\\\n  ON model_file_changes\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Add better validation for file paths\\\\nCREATE OR REPLACE FUNCTION validate_file_path(path text)\\\\nRETURNS boolean AS $$\\\\nBEGIN\\\\n  -- Check if path is null or empty\\\\n  IF path IS NULL OR path = '' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Check for invalid characters\\\\n  IF path ~ '[<>:\\"|?*\\\\\\\\x00-\\\\\\\\x1F]' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Check for relative path traversal\\\\n  IF path ~ '(\\\\\\\\.\\\\\\\\./|\\\\\\\\.\\\\\\\\.\\\\\\\\\\\\\\\\)' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Check for absolute paths\\\\n  IF path ~ '^(/|\\\\\\\\\\\\\\\\|[A-Za-z]:)' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Update trigger function with better validation\\\\nCREATE OR REPLACE FUNCTION validate_model_file_change()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Validate file path\\\\n  IF NOT validate_file_path(NEW.file_path) THEN\\\\n    RAISE EXCEPTION 'Invalid file path'","\\\\n  END IF","\\\\n\\\\n  -- Validate change type\\\\n  IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN\\\\n    RAISE EXCEPTION 'Invalid change type'","\\\\n  END IF","\\\\n\\\\n  -- Ensure commit exists\\\\n  IF NOT EXISTS (\\\\n    SELECT 1 FROM model_commits WHERE id = NEW.commit_id\\\\n  ) THEN\\\\n    RAISE EXCEPTION 'Invalid commit ID'","\\\\n  END IF","\\\\n\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger\\\\nDROP TRIGGER IF EXISTS validate_model_file_change_trigger ON model_file_changes","\\\\nCREATE TRIGGER validate_model_file_change_trigger\\\\n  BEFORE INSERT OR UPDATE ON model_file_changes\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION validate_model_file_change()","\\\\n\\\\n-- Add indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_model_file_changes_path \\\\nON model_file_changes(file_path)","\\\\n\\\\nCREATE INDEX IF NOT EXISTS idx_model_file_changes_commit_lookup\\\\nON model_file_changes(commit_id, change_type)",""}	white_flame
0044	{"\\\\n\\\\n-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Model file changes are viewable by everyone\\" ON model_file_changes","\\\\nDROP POLICY IF EXISTS \\"Users can manage their own model file changes\\" ON model_file_changes","\\\\n\\\\n-- Create simplified policies with better access control\\\\nCREATE POLICY \\"Anyone can view model file changes\\"\\\\n  ON model_file_changes FOR SELECT\\\\n  USING (true)","\\\\n\\\\nCREATE POLICY \\"Model owners can manage file changes\\"\\\\n  ON model_file_changes\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Add function to validate and handle file changes\\\\nCREATE OR REPLACE FUNCTION handle_model_file_change()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Validate commit exists and user has access\\\\n  IF NOT EXISTS (\\\\n    SELECT 1 FROM model_commits mc\\\\n    JOIN models m ON mc.model_id = m.id\\\\n    WHERE mc.id = NEW.commit_id\\\\n    AND m.author_id = auth.uid()\\\\n  ) THEN\\\\n    RAISE EXCEPTION 'Invalid or inaccessible commit'","\\\\n  END IF","\\\\n\\\\n  -- Validate file path\\\\n  IF NEW.file_path IS NULL OR NEW.file_path = '' OR \\\\n     NEW.file_path ~ '(\\\\\\\\.\\\\\\\\./|\\\\\\\\.\\\\\\\\.\\\\\\\\\\\\\\\\|^/|^\\\\\\\\\\\\\\\\|[<>:\\"|?*\\\\\\\\x00-\\\\\\\\x1F])' THEN\\\\n    RAISE EXCEPTION 'Invalid file path'","\\\\n  END IF","\\\\n\\\\n  -- Validate change type\\\\n  IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN\\\\n    RAISE EXCEPTION 'Invalid change type'","\\\\n  END IF","\\\\n\\\\n  RETURN NEW","\\\\nEXCEPTION WHEN OTHERS THEN\\\\n  -- Log error details\\\\n  RAISE WARNING 'Error in file change: %', SQLERRM","\\\\n  RETURN NULL","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger for validation\\\\nDROP TRIGGER IF EXISTS handle_model_file_change_trigger ON model_file_changes","\\\\nCREATE TRIGGER handle_model_file_change_trigger\\\\n  BEFORE INSERT OR UPDATE ON model_file_changes\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION handle_model_file_change()","\\\\n\\\\n-- Add indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_model_file_changes_lookup \\\\nON model_file_changes(commit_id, file_path, change_type)","\\\\n\\\\n-- Add cascade delete to ensure proper cleanup\\\\nALTER TABLE model_file_changes\\\\nDROP CONSTRAINT IF EXISTS model_file_changes_commit_id_fkey,\\\\nADD CONSTRAINT model_file_changes_commit_id_fkey\\\\n  FOREIGN KEY (commit_id)\\\\n  REFERENCES model_commits(id)\\\\n  ON DELETE CASCADE",""}	old_canyon
0045	{"\\\\n\\\\n-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Anyone can view model file changes\\" ON model_file_changes","\\\\nDROP POLICY IF EXISTS \\"Model owners can manage file changes\\" ON model_file_changes","\\\\n\\\\n-- Create simplified policies with better access control\\\\nCREATE POLICY \\"Model file changes are viewable by everyone\\"\\\\n  ON model_file_changes FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Model owners can manage file changes\\"\\\\n  ON model_file_changes\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Add function to validate commit messages\\\\nCREATE OR REPLACE FUNCTION validate_commit_message(message text)\\\\nRETURNS boolean AS $$\\\\nBEGIN\\\\n  -- Check if message is null or empty\\\\n  IF message IS NULL OR trim(message) = '' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Check message length\\\\n  IF length(message) > 1000 THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Add function to handle commit creation\\\\nCREATE OR REPLACE FUNCTION handle_model_commit()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Validate commit message\\\\n  IF NOT validate_commit_message(NEW.message) THEN\\\\n    RAISE EXCEPTION 'Invalid commit message'","\\\\n  END IF","\\\\n\\\\n  -- Validate files array\\\\n  IF NEW.files IS NULL OR array_length(NEW.files, 1) = 0 THEN\\\\n    RAISE EXCEPTION 'At least one file must be changed'","\\\\n  END IF","\\\\n\\\\n  -- Validate file paths\\\\n  FOR i IN 1..array_length(NEW.files, 1) LOOP\\\\n    IF NOT validate_file_path(NEW.files[i]) THEN\\\\n      RAISE EXCEPTION 'Invalid file path: %', NEW.files[i]","\\\\n    END IF","\\\\n  END LOOP","\\\\n\\\\n  RETURN NEW","\\\\nEXCEPTION WHEN OTHERS THEN\\\\n  -- Log error details\\\\n  RAISE WARNING 'Error in commit: %', SQLERRM","\\\\n  RETURN NULL","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger for commit validation\\\\nDROP TRIGGER IF EXISTS handle_model_commit_trigger ON model_commits","\\\\nCREATE TRIGGER handle_model_commit_trigger\\\\n  BEFORE INSERT OR UPDATE ON model_commits\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION handle_model_commit()","\\\\n\\\\n-- Add function to automatically create file changes\\\\nCREATE OR REPLACE FUNCTION create_file_changes()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Insert file changes for each file in the commit\\\\n  INSERT INTO model_file_changes (commit_id, file_path, change_type)\\\\n  SELECT \\\\n    NEW.id,\\\\n    unnest(NEW.files),\\\\n    'modified'\\\\n  ON CONFLICT DO NOTHING","\\\\n\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger to automatically create file changes\\\\nDROP TRIGGER IF EXISTS create_file_changes_trigger ON model_commits","\\\\nCREATE TRIGGER create_file_changes_trigger\\\\n  AFTER INSERT ON model_commits\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION create_file_changes()","\\\\n\\\\n-- Add indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_model_commits_lookup \\\\nON model_commits(model_id, created_at DESC)","\\\\n\\\\nCREATE INDEX IF NOT EXISTS idx_model_file_changes_lookup \\\\nON model_file_changes(commit_id, file_path)",""}	dry_forest
0046	{"\\\\n\\\\n-- Drop existing policies\\\\nDROP POLICY IF EXISTS \\"Model file changes are viewable by everyone\\" ON model_file_changes","\\\\nDROP POLICY IF EXISTS \\"Model owners can manage file changes\\" ON model_file_changes","\\\\n\\\\n-- Create simplified policies with better access control\\\\nCREATE POLICY \\"Model file changes are viewable by everyone\\"\\\\n  ON model_file_changes FOR SELECT\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Model owners can manage file changes\\"\\\\n  ON model_file_changes\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    EXISTS (\\\\n      SELECT 1 FROM model_commits mc\\\\n      JOIN models m ON mc.model_id = m.id\\\\n      WHERE mc.id = model_file_changes.commit_id\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Add function to validate commit messages\\\\nCREATE OR REPLACE FUNCTION validate_commit_message(message text)\\\\nRETURNS boolean AS $$\\\\nBEGIN\\\\n  -- Check if message is null or empty\\\\n  IF message IS NULL OR trim(message) = '' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Check message length\\\\n  IF length(message) > 1000 THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Add function to handle commit creation\\\\nCREATE OR REPLACE FUNCTION handle_model_commit()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Validate commit message\\\\n  IF NOT validate_commit_message(NEW.message) THEN\\\\n    RAISE EXCEPTION 'Invalid commit message'","\\\\n  END IF","\\\\n\\\\n  -- Validate files array\\\\n  IF NEW.files IS NULL OR array_length(NEW.files, 1) = 0 THEN\\\\n    RAISE EXCEPTION 'At least one file must be changed'","\\\\n  END IF","\\\\n\\\\n  -- Validate file paths\\\\n  FOR i IN 1..array_length(NEW.files, 1) LOOP\\\\n    IF NOT validate_file_path(NEW.files[i]) THEN\\\\n      RAISE EXCEPTION 'Invalid file path: %', NEW.files[i]","\\\\n    END IF","\\\\n  END LOOP","\\\\n\\\\n  -- Generate commit hash if not provided\\\\n  IF NEW.hash IS NULL THEN\\\\n    NEW.hash := encode(digest(NEW.message || array_to_string(NEW.files, ',') || NEW.created_at::text, 'sha1'), 'hex')","\\\\n  END IF","\\\\n\\\\n  RETURN NEW","\\\\nEXCEPTION WHEN OTHERS THEN\\\\n  -- Log error details\\\\n  RAISE WARNING 'Error in commit: %', SQLERRM","\\\\n  RETURN NULL","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger for commit validation\\\\nDROP TRIGGER IF EXISTS handle_model_commit_trigger ON model_commits","\\\\nCREATE TRIGGER handle_model_commit_trigger\\\\n  BEFORE INSERT OR UPDATE ON model_commits\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION handle_model_commit()","\\\\n\\\\n-- Add function to automatically create file changes\\\\nCREATE OR REPLACE FUNCTION create_file_changes()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Insert file changes for each file in the commit\\\\n  INSERT INTO model_file_changes (commit_id, file_path, change_type)\\\\n  SELECT \\\\n    NEW.id,\\\\n    unnest(NEW.files),\\\\n    'modified'\\\\n  ON CONFLICT DO NOTHING","\\\\n\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger to automatically create file changes\\\\nDROP TRIGGER IF EXISTS create_file_changes_trigger ON model_commits","\\\\nCREATE TRIGGER create_file_changes_trigger\\\\n  AFTER INSERT ON model_commits\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION create_file_changes()","\\\\n\\\\n-- Add indexes for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_model_commits_lookup \\\\nON model_commits(model_id, created_at DESC)","\\\\n\\\\nCREATE INDEX IF NOT EXISTS idx_model_file_changes_lookup \\\\nON model_file_changes(commit_id, file_path)","\\\\n\\\\n-- Add function to handle file change errors\\\\nCREATE OR REPLACE FUNCTION handle_file_change_error()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  BEGIN\\\\n    -- Validate file path\\\\n    IF NEW.file_path IS NULL OR NEW.file_path = '' THEN\\\\n      RAISE EXCEPTION 'Invalid file path'","\\\\n    END IF","\\\\n\\\\n    -- Validate change type\\\\n    IF NEW.change_type NOT IN ('added', 'modified', 'deleted') THEN\\\\n      RAISE EXCEPTION 'Invalid change type'","\\\\n    END IF","\\\\n\\\\n    -- Ensure commit exists\\\\n    IF NOT EXISTS (\\\\n      SELECT 1 FROM model_commits WHERE id = NEW.commit_id\\\\n    ) THEN\\\\n      RAISE EXCEPTION 'Invalid commit ID'","\\\\n    END IF","\\\\n\\\\n    RETURN NEW","\\\\n  EXCEPTION WHEN OTHERS THEN\\\\n    -- Log error and return NULL to prevent insert\\\\n    RAISE WARNING 'Error in file change: %', SQLERRM","\\\\n    RETURN NULL","\\\\n  END","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create trigger for file change validation\\\\nDROP TRIGGER IF EXISTS handle_file_change_error_trigger ON model_file_changes","\\\\nCREATE TRIGGER handle_file_change_error_trigger\\\\n  BEFORE INSERT OR UPDATE ON model_file_changes\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION handle_file_change_error()",""}	floating_pond
0047	{"\\\\n\\\\n-- Add better validation for commit messages\\\\nCREATE OR REPLACE FUNCTION validate_commit_message(message text)\\\\nRETURNS boolean AS $$\\\\nBEGIN\\\\n  -- Check if message is null or empty\\\\n  IF message IS NULL OR trim(message) = '' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Check message length (between 3 and 1000 characters)\\\\n  IF length(trim(message)) < 3 OR length(message) > 1000 THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Check for valid characters\\\\n  IF message ~ '[^\\\\\\\\x20-\\\\\\\\x7E\\\\\\\\n]' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Update commit handling function\\\\nCREATE OR REPLACE FUNCTION handle_model_commit()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  -- Validate commit message\\\\n  IF NOT validate_commit_message(NEW.message) THEN\\\\n    RAISE EXCEPTION 'Invalid commit message: Message must be between 3 and 1000 characters and contain only valid characters'","\\\\n  END IF","\\\\n\\\\n  -- Clean message text\\\\n  NEW.message := trim(NEW.message)","\\\\n\\\\n  -- Generate commit hash\\\\n  NEW.hash := encode(digest(NEW.message || array_to_string(NEW.files, ',') || NEW.created_at::text, 'sha1'), 'hex')","\\\\n\\\\n  RETURN NEW","\\\\nEXCEPTION WHEN OTHERS THEN\\\\n  RAISE WARNING 'Error in commit: %', SQLERRM","\\\\n  RETURN NULL","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Add message constraints to model_commits table\\\\nALTER TABLE model_commits\\\\nALTER COLUMN message SET NOT NULL,\\\\nADD CONSTRAINT message_length CHECK (length(message) BETWEEN 3 AND 1000),\\\\nADD CONSTRAINT message_characters CHECK (message ~ '^[\\\\\\\\x20-\\\\\\\\x7E\\\\\\\\n]*$')",""}	tender_fountain
0048	{"\\\\n\\\\n-- Add GitHub-specific columns\\\\nALTER TABLE profiles\\\\nADD COLUMN IF NOT EXISTS github_id text,\\\\nADD COLUMN IF NOT EXISTS github_access_token text,\\\\nADD COLUMN IF NOT EXISTS github_username text","\\\\n\\\\n-- Add unique constraint on github_id\\\\nALTER TABLE profiles\\\\nADD CONSTRAINT unique_github_id UNIQUE (github_id)","\\\\n\\\\n-- Create function to handle GitHub OAuth callback\\\\nCREATE OR REPLACE FUNCTION handle_github_oauth_callback(\\\\n  user_id uuid,\\\\n  gh_id text,\\\\n  gh_username text,\\\\n  gh_token text\\\\n) RETURNS void AS $$\\\\nBEGIN\\\\n  UPDATE profiles\\\\n  SET \\\\n    github_id = gh_id,\\\\n    github_username = gh_username,\\\\n    github_access_token = gh_token,\\\\n    github_url = 'https://github.com/' || gh_username,\\\\n    updated_at = now()\\\\n  WHERE id = user_id","\\\\nEND","\\\\n$$ LANGUAGE plpgsql SECURITY DEFINER",""}	pale_sun
0049	{"\\\\n\\\\n-- Add new columns to profiles table\\\\nALTER TABLE profiles\\\\nADD COLUMN IF NOT EXISTS organizations JSONB DEFAULT '[]',\\\\nADD COLUMN IF NOT EXISTS interests TEXT[] DEFAULT '{}'","\\\\n\\\\n-- Add constraint to validate organizations is an array\\\\nALTER TABLE profiles\\\\nADD CONSTRAINT valid_organizations_type \\\\nCHECK (jsonb_typeof(organizations) = 'array')","\\\\n\\\\n-- Add constraint to validate interests array length\\\\nALTER TABLE profiles\\\\nADD CONSTRAINT valid_interests_length\\\\nCHECK (\\\\n  interests IS NULL OR \\\\n  array_length(interests, 1) <= 10\\\\n)","\\\\n\\\\n-- Create function to validate organization structure\\\\nCREATE OR REPLACE FUNCTION validate_organization_entry(org jsonb)\\\\nRETURNS boolean AS $$\\\\nBEGIN\\\\n  RETURN (\\\\n    jsonb_typeof(org->'id') = 'string' AND\\\\n    jsonb_typeof(org->'name') = 'string' AND\\\\n    jsonb_typeof(org->'role') = 'string'\\\\n  )","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Add trigger to validate organization entries\\\\nCREATE OR REPLACE FUNCTION validate_organizations()\\\\nRETURNS trigger AS $$\\\\nDECLARE\\\\n  org jsonb","\\\\nBEGIN\\\\n  IF NEW.organizations IS NOT NULL THEN\\\\n    FOR org IN SELECT * FROM jsonb_array_elements(NEW.organizations)\\\\n    LOOP\\\\n      IF NOT validate_organization_entry(org) THEN\\\\n        RAISE EXCEPTION 'Invalid organization entry structure'","\\\\n      END IF","\\\\n    END LOOP","\\\\n  END IF","\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\nCREATE TRIGGER validate_organizations_trigger\\\\n  BEFORE INSERT OR UPDATE ON profiles\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION validate_organizations()","\\\\n\\\\n-- Update RLS policies\\\\nCREATE POLICY \\"Users can update their own organizations and interests\\"\\\\n  ON profiles\\\\n  FOR UPDATE\\\\n  TO authenticated\\\\n  USING (auth.uid() = id)\\\\n  WITH CHECK (auth.uid() = id)",""}	round_math
0051	{"-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Model files are readable by everyone\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can upload their model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can update their model files\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can delete their model files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create function to validate storage path structure\\\\nCREATE OR REPLACE FUNCTION storage.validate_model_file_path(path text)\\\\nRETURNS boolean AS $$\\\\nDECLARE\\\\n  path_parts text[]","\\\\nBEGIN\\\\n  -- Split path into parts\\\\n  path_parts := string_to_array(path, '/')","\\\\n  \\\\n  -- Validate path has at least 4 parts: userId/models/modelId/filename\\\\n  IF array_length(path_parts, 1) < 4 THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate second part is 'models'\\\\n  IF path_parts[2] != 'models' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate modelId is a UUID\\\\n  IF path_parts[3] !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create simplified policies with better access control\\\\nCREATE POLICY \\"Model files are readable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage their model files\\"\\\\n  ON storage.objects\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    split_part(name, '/', 1) = auth.uid()::text AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create index for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_storage_model_files\\\\n  ON storage.objects (bucket_id, name)\\\\n  WHERE bucket_id = 'model-files'",""}	late_bonus
0052	{"-- Drop existing policies\\\\nDO $$ \\\\nBEGIN\\\\n  DROP POLICY IF EXISTS \\"Model files are readable by everyone\\" ON storage.objects","\\\\n  DROP POLICY IF EXISTS \\"Users can manage their model files\\" ON storage.objects","\\\\nEXCEPTION\\\\n  WHEN OTHERS THEN NULL","\\\\nEND $$","\\\\n\\\\n-- Create function to validate storage path structure\\\\nCREATE OR REPLACE FUNCTION storage.validate_model_file_path(path text)\\\\nRETURNS boolean AS $$\\\\nDECLARE\\\\n  path_parts text[]","\\\\n  filename text","\\\\nBEGIN\\\\n  -- Split path into parts\\\\n  path_parts := string_to_array(path, '/')","\\\\n  \\\\n  -- Validate path has at least 4 parts: userId/models/modelId/filename\\\\n  IF array_length(path_parts, 1) < 4 THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate second part is 'models'\\\\n  IF path_parts[2] != 'models' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Validate modelId is a UUID\\\\n  IF path_parts[3] !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  -- Get filename (last part)\\\\n  filename := path_parts[array_length(path_parts, 1)]","\\\\n\\\\n  -- Validate filename format\\\\n  IF filename !~ '^[\\\\\\\\w\\\\\\\\-. ]+$' THEN\\\\n    RETURN false","\\\\n  END IF","\\\\n\\\\n  RETURN true","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create simplified policies with better access control\\\\nCREATE POLICY \\"Model files are readable by everyone\\"\\\\n  ON storage.objects FOR SELECT\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND (NOT m.is_private OR m.author_id = auth.uid())\\\\n    )\\\\n  )","\\\\n\\\\nCREATE POLICY \\"Users can manage their model files\\"\\\\n  ON storage.objects\\\\n  FOR ALL\\\\n  TO authenticated\\\\n  USING (\\\\n    bucket_id = 'model-files' AND\\\\n    storage.validate_model_file_path(name) AND\\\\n    split_part(name, '/', 1) = auth.uid()::text AND\\\\n    EXISTS (\\\\n      SELECT 1 FROM models m\\\\n      WHERE m.id::text = split_part(name, '/', 3)\\\\n      AND m.author_id = auth.uid()\\\\n    )\\\\n  )","\\\\n\\\\n-- Create index for better performance\\\\nCREATE INDEX IF NOT EXISTS idx_storage_model_files\\\\n  ON storage.objects (bucket_id, name)\\\\n  WHERE bucket_id = 'model-files'",""}	patient_harbor
20250107135823	{"-- Create auth schema\\\\nCREATE SCHEMA IF NOT EXISTS auth","\\\\n\\\\n-- Create users table\\\\nCREATE TABLE IF NOT EXISTS auth.users (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  email text UNIQUE NOT NULL,\\\\n  encrypted_password text NOT NULL,\\\\n  created_at timestamptz DEFAULT now(),\\\\n  updated_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Create profiles table\\\\nCREATE TABLE IF NOT EXISTS public.profiles (\\\\n  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,\\\\n  username text UNIQUE NOT NULL,\\\\n  display_name text,\\\\n  avatar_url text,\\\\n  bio text,\\\\n  github_url text,\\\\n  website_url text,\\\\n  created_at timestamptz DEFAULT now(),\\\\n  updated_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Create function to update updated_at\\\\nCREATE OR REPLACE FUNCTION update_updated_at()\\\\nRETURNS trigger AS $$\\\\nBEGIN\\\\n  NEW.updated_at = now()","\\\\n  RETURN NEW","\\\\nEND","\\\\n$$ LANGUAGE plpgsql","\\\\n\\\\n-- Create triggers\\\\nCREATE TRIGGER update_users_updated_at\\\\n  BEFORE UPDATE ON auth.users\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at()","\\\\n\\\\nCREATE TRIGGER update_profiles_updated_at\\\\n  BEFORE UPDATE ON public.profiles\\\\n  FOR EACH ROW\\\\n  EXECUTE FUNCTION update_updated_at()",""}	mellow_shadow
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 86, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guardian_groupobjectpermission_id_seq', 1, false);


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guardian_userobjectpermission_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: dataset_tags dataset_tags_dataset_id_tag_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataset_tags
    ADD CONSTRAINT dataset_tags_dataset_id_tag_key UNIQUE (dataset_id, tag);


--
-- Name: dataset_tags dataset_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataset_tags
    ADD CONSTRAINT dataset_tags_pkey PRIMARY KEY (id);


--
-- Name: datasets datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: model_commits model_commits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_commits
    ADD CONSTRAINT model_commits_pkey PRIMARY KEY (id);


--
-- Name: model_file_changes model_file_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_file_changes
    ADD CONSTRAINT model_file_changes_pkey PRIMARY KEY (id);


--
-- Name: model_tags model_tags_model_id_tag_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_tags
    ADD CONSTRAINT model_tags_model_id_tag_key UNIQUE (model_id, tag);


--
-- Name: model_tags model_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_tags
    ADD CONSTRAINT model_tags_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);


--
-- Name: repo repo_owner_id_full_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo
    ADD CONSTRAINT repo_owner_id_full_path_key UNIQUE (owner_id, full_path);


--
-- Name: repo repo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo
    ADD CONSTRAINT repo_pkey PRIMARY KEY (id);


--
-- Name: space_tags space_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_tags
    ADD CONSTRAINT space_tags_pkey PRIMARY KEY (id);


--
-- Name: space_tags space_tags_space_id_tag_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_tags
    ADD CONSTRAINT space_tags_space_id_tag_key UNIQUE (space_id, tag);


--
-- Name: spaces spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT spaces_pkey PRIMARY KEY (id);


--
-- Name: profiles unique_github_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT unique_github_id UNIQUE (github_id);


--
-- Name: models unique_model_per_author; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT unique_model_per_author UNIQUE (title, author_id);


--
-- Name: spaces unique_slug_per_author; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT unique_slug_per_author UNIQUE (author_id, slug);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: guardian_gr_content_ae6aec_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_gr_content_ae6aec_idx ON public.guardian_groupobjectpermission USING btree (content_type_id, object_pk);


--
-- Name: guardian_groupobjectpermission_content_type_id_7ade36b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_groupobjectpermission_content_type_id_7ade36b8 ON public.guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id_4bbbfb62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_groupobjectpermission_group_id_4bbbfb62 ON public.guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id_36572738; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_groupobjectpermission_permission_id_36572738 ON public.guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_us_content_179ed2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_us_content_179ed2_idx ON public.guardian_userobjectpermission USING btree (content_type_id, object_pk);


--
-- Name: guardian_userobjectpermission_content_type_id_2e892405; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_userobjectpermission_content_type_id_2e892405 ON public.guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id_71807bfc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_userobjectpermission_permission_id_71807bfc ON public.guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guardian_userobjectpermission_user_id_d5c1e964 ON public.guardian_userobjectpermission USING btree (user_id);


--
-- Name: idx_dataset_tags_dataset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dataset_tags_dataset ON public.dataset_tags USING btree (dataset_id);


--
-- Name: idx_dataset_tags_dataset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dataset_tags_dataset_id ON public.dataset_tags USING btree (dataset_id);


--
-- Name: idx_dataset_tags_tag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dataset_tags_tag ON public.dataset_tags USING btree (tag);


--
-- Name: idx_datasets_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_author_id ON public.datasets USING btree (author_id);


--
-- Name: idx_datasets_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_created_at ON public.datasets USING btree (created_at DESC);


--
-- Name: idx_datasets_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_featured ON public.datasets USING btree (is_featured) WHERE (is_featured = true);


--
-- Name: idx_datasets_format; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_format ON public.datasets USING btree (format);


--
-- Name: idx_datasets_is_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_is_owner ON public.datasets USING btree (is_owner) WHERE (is_owner = true);


--
-- Name: idx_datasets_privacy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_privacy ON public.datasets USING btree (is_private, author_id);


--
-- Name: idx_datasets_public; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_public ON public.datasets USING btree (created_at DESC) WHERE (NOT is_private);


--
-- Name: idx_datasets_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_type ON public.datasets USING btree (type);


--
-- Name: idx_datasets_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_datasets_updated_at ON public.datasets USING btree (updated_at DESC);


--
-- Name: idx_model_commits_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_commits_author_id ON public.model_commits USING btree (author_id);


--
-- Name: idx_model_commits_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_commits_created_at ON public.model_commits USING btree (created_at DESC);


--
-- Name: idx_model_commits_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_commits_hash ON public.model_commits USING btree (hash);


--
-- Name: idx_model_commits_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_commits_lookup ON public.model_commits USING btree (model_id, created_at DESC);


--
-- Name: idx_model_commits_model_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_commits_model_id ON public.model_commits USING btree (model_id);


--
-- Name: idx_model_file_changes_commit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_file_changes_commit_id ON public.model_file_changes USING btree (commit_id);


--
-- Name: idx_model_file_changes_commit_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_file_changes_commit_lookup ON public.model_file_changes USING btree (commit_id, change_type);


--
-- Name: idx_model_file_changes_file_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_file_changes_file_path ON public.model_file_changes USING btree (file_path);


--
-- Name: idx_model_file_changes_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_file_changes_lookup ON public.model_file_changes USING btree (commit_id, file_path);


--
-- Name: idx_model_file_changes_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_file_changes_path ON public.model_file_changes USING btree (file_path);


--
-- Name: idx_model_tags_model_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_tags_model_id ON public.model_tags USING btree (model_id);


--
-- Name: idx_model_tags_tag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_tags_tag ON public.model_tags USING btree (tag);


--
-- Name: idx_models_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_models_author_id ON public.models USING btree (author_id);


--
-- Name: idx_models_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_models_created_at ON public.models USING btree (created_at DESC);


--
-- Name: idx_models_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_models_featured ON public.models USING btree (is_featured) WHERE (is_featured = true);


--
-- Name: idx_models_framework; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_models_framework ON public.models USING btree (framework);


--
-- Name: idx_models_is_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_models_is_owner ON public.models USING btree (is_owner) WHERE (is_owner = true);


--
-- Name: idx_models_privacy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_models_privacy ON public.models USING btree (is_private, author_id);


--
-- Name: idx_models_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_models_updated_at ON public.models USING btree (updated_at DESC);


--
-- Name: idx_profiles_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_updated_at ON public.profiles USING btree (updated_at DESC);


--
-- Name: idx_repo_owner_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_repo_owner_path ON public.repo USING btree (owner_id, full_path);


--
-- Name: idx_repo_storage_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_repo_storage_id ON public.repo USING btree (storage_id);


--
-- Name: idx_repo_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_repo_type ON public.repo USING btree (type);


--
-- Name: idx_space_tags_space_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_space_tags_space_id ON public.space_tags USING btree (space_id);


--
-- Name: idx_spaces_author_content; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_author_content ON public.spaces USING btree (author_id, created_at DESC);


--
-- Name: idx_spaces_author_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_author_featured ON public.spaces USING btree (author_id) WHERE (is_featured = true);


--
-- Name: idx_spaces_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_author_id ON public.spaces USING btree (author_id);


--
-- Name: idx_spaces_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_created_at ON public.spaces USING btree (created_at DESC);


--
-- Name: idx_spaces_framework; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_framework ON public.spaces USING btree (framework);


--
-- Name: idx_spaces_is_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_is_owner ON public.spaces USING btree (is_owner) WHERE (is_owner = true);


--
-- Name: idx_spaces_privacy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_privacy ON public.spaces USING btree (is_private, author_id) WHERE (is_private = true);


--
-- Name: idx_spaces_public; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_public ON public.spaces USING btree (created_at DESC) WHERE (is_private = false);


--
-- Name: idx_spaces_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_type ON public.spaces USING btree (type);


--
-- Name: idx_spaces_type_tag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_type_tag ON public.space_tags USING btree (tag) WHERE (tag = ANY (ARRAY['model'::text, 'dataset'::text, 'space'::text]));


--
-- Name: idx_spaces_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spaces_updated_at ON public.spaces USING btree (updated_at DESC);


--
-- Name: space_tags_space_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX space_tags_space_id_idx ON public.space_tags USING btree (space_id);


--
-- Name: space_tags_tag_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX space_tags_tag_idx ON public.space_tags USING btree (tag);


--
-- Name: spaces_author_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spaces_author_id_idx ON public.spaces USING btree (author_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_storage_model_files; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_storage_model_files ON storage.objects USING btree (name) WHERE (bucket_id = 'model-files'::text);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: users update_users_updated_at; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON auth.users FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: model_commits create_file_changes_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER create_file_changes_trigger AFTER INSERT ON public.model_commits FOR EACH ROW EXECUTE FUNCTION public.create_file_changes();


--
-- Name: spaces ensure_space_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ensure_space_type AFTER INSERT OR UPDATE ON public.spaces FOR EACH ROW EXECUTE FUNCTION public.validate_space_type();


--
-- Name: model_file_changes handle_file_change_error_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER handle_file_change_error_trigger BEFORE INSERT OR UPDATE ON public.model_file_changes FOR EACH ROW EXECUTE FUNCTION public.handle_file_change_error();


--
-- Name: model_commits handle_model_commit_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER handle_model_commit_trigger BEFORE INSERT OR UPDATE ON public.model_commits FOR EACH ROW EXECUTE FUNCTION public.handle_model_commit();


--
-- Name: model_file_changes handle_model_file_change_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER handle_model_file_change_trigger BEFORE INSERT OR UPDATE ON public.model_file_changes FOR EACH ROW EXECUTE FUNCTION public.handle_model_file_change();


--
-- Name: spaces spaces_set_slug; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER spaces_set_slug BEFORE INSERT OR UPDATE ON public.spaces FOR EACH ROW EXECUTE FUNCTION public.set_slug();


--
-- Name: datasets update_datasets_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_datasets_updated_at BEFORE UPDATE ON public.datasets FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: models update_models_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_models_updated_at BEFORE UPDATE ON public.models FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: profiles update_profile_updated_at_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_profile_updated_at_trigger BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_profile_updated_at();


--
-- Name: profiles update_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: repo update_repo_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_repo_updated_at BEFORE UPDATE ON public.repo FOR EACH ROW EXECUTE FUNCTION public.update_repo_updated_at();


--
-- Name: spaces update_spaces_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_spaces_updated_at BEFORE UPDATE ON public.spaces FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: model_file_changes validate_file_changes_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validate_file_changes_trigger BEFORE INSERT OR UPDATE ON public.model_file_changes FOR EACH ROW EXECUTE FUNCTION public.validate_file_changes();


--
-- Name: model_file_changes validate_model_file_change_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validate_model_file_change_trigger BEFORE INSERT OR UPDATE ON public.model_file_changes FOR EACH ROW EXECUTE FUNCTION public.validate_model_file_change();


--
-- Name: profiles validate_organizations_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validate_organizations_trigger BEFORE INSERT OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.validate_organizations();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects on_storage_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER on_storage_delete AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION public.handle_storage_change();


--
-- Name: objects on_storage_insert; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER on_storage_insert AFTER INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION public.handle_storage_change();


--
-- Name: objects on_storage_update; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER on_storage_update AFTER UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION public.handle_storage_change();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataset_tags dataset_tags_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataset_tags
    ADD CONSTRAINT dataset_tags_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id) ON DELETE CASCADE;


--
-- Name: datasets datasets_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_content_type_id_7ade36b8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_group_id_4bbbfb62_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_permission_id_36572738_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_content_type_id_2e892405_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_permission_id_71807bfc_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: model_commits model_commits_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_commits
    ADD CONSTRAINT model_commits_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: model_commits model_commits_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_commits
    ADD CONSTRAINT model_commits_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;


--
-- Name: model_file_changes model_file_changes_commit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_file_changes
    ADD CONSTRAINT model_file_changes_commit_id_fkey FOREIGN KEY (commit_id) REFERENCES public.model_commits(id) ON DELETE CASCADE;


--
-- Name: model_tags model_tags_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_tags
    ADD CONSTRAINT model_tags_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;


--
-- Name: models models_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: repo repo_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo
    ADD CONSTRAINT repo_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: space_tags space_tags_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_tags
    ADD CONSTRAINT space_tags_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.spaces(id) ON DELETE CASCADE;


--
-- Name: spaces spaces_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT spaces_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: spaces Authenticated users can create spaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can create spaces" ON public.spaces FOR INSERT TO authenticated WITH CHECK ((auth.uid() = author_id));


--
-- Name: dataset_tags Dataset tags are viewable with dataset; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Dataset tags are viewable with dataset" ON public.dataset_tags FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.datasets
  WHERE ((datasets.id = dataset_tags.dataset_id) AND ((NOT datasets.is_private) OR (datasets.author_id = auth.uid()))))));


--
-- Name: model_commits Model commits are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Model commits are viewable by everyone" ON public.model_commits FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.models m
  WHERE ((m.id = model_commits.model_id) AND ((NOT m.is_private) OR (m.author_id = auth.uid()))))));


--
-- Name: model_file_changes Model file changes are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Model file changes are viewable by everyone" ON public.model_file_changes FOR SELECT USING ((EXISTS ( SELECT 1
   FROM (public.model_commits mc
     JOIN public.models m ON ((mc.model_id = m.id)))
  WHERE ((mc.id = model_file_changes.commit_id) AND ((NOT m.is_private) OR (m.author_id = auth.uid()))))));


--
-- Name: model_file_changes Model owners can manage file changes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Model owners can manage file changes" ON public.model_file_changes TO authenticated USING ((EXISTS ( SELECT 1
   FROM (public.model_commits mc
     JOIN public.models m ON ((mc.model_id = m.id)))
  WHERE ((mc.id = model_file_changes.commit_id) AND (m.author_id = auth.uid())))));


--
-- Name: model_tags Model tags are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Model tags are viewable by everyone" ON public.model_tags FOR SELECT USING (true);


--
-- Name: models Models are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Models are viewable by everyone" ON public.models FOR SELECT USING (true);


--
-- Name: profiles Profiles are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Profiles are viewable by everyone" ON public.profiles FOR SELECT USING (true);


--
-- Name: datasets Public datasets are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public datasets are viewable by everyone" ON public.datasets FOR SELECT USING (((NOT is_private) OR (auth.uid() = author_id)));


--
-- Name: models Public models are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public models are viewable by everyone" ON public.models FOR SELECT USING (((NOT is_private) OR (auth.uid() = author_id)));


--
-- Name: space_tags Space tags are viewable by everyone; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Space tags are viewable by everyone" ON public.space_tags FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.spaces
  WHERE ((spaces.id = space_tags.space_id) AND ((NOT spaces.is_private) OR (auth.uid() = spaces.author_id))))));


--
-- Name: model_commits Users can create commits for their models; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create commits for their models" ON public.model_commits FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.models
  WHERE ((models.id = model_commits.model_id) AND (models.author_id = auth.uid())))));


--
-- Name: datasets Users can create their own datasets; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create their own datasets" ON public.datasets FOR INSERT TO authenticated WITH CHECK ((auth.uid() = author_id));


--
-- Name: models Users can create their own models; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create their own models" ON public.models FOR INSERT TO authenticated WITH CHECK ((auth.uid() = author_id));


--
-- Name: datasets Users can delete their own datasets; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own datasets" ON public.datasets FOR DELETE TO authenticated USING ((auth.uid() = author_id));


--
-- Name: models Users can delete their own models; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own models" ON public.models FOR DELETE TO authenticated USING ((auth.uid() = author_id));


--
-- Name: spaces Users can delete their own spaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own spaces" ON public.spaces FOR DELETE TO authenticated USING ((auth.uid() = author_id));


--
-- Name: profiles Users can insert their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own profile" ON public.profiles FOR INSERT TO authenticated WITH CHECK ((auth.uid() = id));


--
-- Name: dataset_tags Users can manage tags for own datasets; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage tags for own datasets" ON public.dataset_tags TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.datasets
  WHERE ((datasets.id = dataset_tags.dataset_id) AND (datasets.author_id = auth.uid())))));


--
-- Name: model_tags Users can manage tags for own models; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage tags for own models" ON public.model_tags USING ((EXISTS ( SELECT 1
   FROM public.models
  WHERE ((models.id = model_tags.model_id) AND (models.author_id = auth.uid())))));


--
-- Name: space_tags Users can manage tags for own spaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage tags for own spaces" ON public.space_tags USING ((EXISTS ( SELECT 1
   FROM public.spaces
  WHERE ((spaces.id = space_tags.space_id) AND (auth.uid() = spaces.author_id)))));


--
-- Name: repo Users can manage their own repos; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own repos" ON public.repo TO authenticated USING ((owner_id = auth.uid())) WITH CHECK ((owner_id = auth.uid()));


--
-- Name: profiles Users can read their own theme preference; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read their own theme preference" ON public.profiles FOR SELECT TO authenticated USING ((auth.uid() = id));


--
-- Name: spaces Users can update own spaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own spaces" ON public.spaces FOR UPDATE USING ((auth.uid() = author_id));


--
-- Name: datasets Users can update their own datasets; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own datasets" ON public.datasets FOR UPDATE TO authenticated USING ((auth.uid() = author_id));


--
-- Name: models Users can update their own models; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own models" ON public.models FOR UPDATE TO authenticated USING ((auth.uid() = author_id));


--
-- Name: profiles Users can update their own organizations and interests; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own organizations and interests" ON public.profiles FOR UPDATE TO authenticated USING ((auth.uid() = id)) WITH CHECK ((auth.uid() = id));


--
-- Name: profiles Users can update their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own profile" ON public.profiles FOR UPDATE TO authenticated USING ((auth.uid() = id)) WITH CHECK ((auth.uid() = id));


--
-- Name: profiles Users can update their own theme preference; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own theme preference" ON public.profiles FOR UPDATE TO authenticated USING ((auth.uid() = id)) WITH CHECK ((auth.uid() = id));


--
-- Name: spaces Users can view own spaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own spaces" ON public.spaces FOR SELECT TO authenticated USING ((auth.uid() = author_id));


--
-- Name: spaces Users can view public spaces; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view public spaces" ON public.spaces FOR SELECT USING ((NOT is_private));


--
-- Name: repo Users can view their own repos; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own repos" ON public.repo FOR SELECT TO authenticated USING ((owner_id = auth.uid()));


--
-- Name: dataset_tags; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.dataset_tags ENABLE ROW LEVEL SECURITY;

--
-- Name: datasets; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.datasets ENABLE ROW LEVEL SECURITY;

--
-- Name: model_commits; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.model_commits ENABLE ROW LEVEL SECURITY;

--
-- Name: model_file_changes; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.model_file_changes ENABLE ROW LEVEL SECURITY;

--
-- Name: model_tags; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.model_tags ENABLE ROW LEVEL SECURITY;

--
-- Name: models; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.models ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: repo; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.repo ENABLE ROW LEVEL SECURITY;

--
-- Name: space_tags; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.space_tags ENABLE ROW LEVEL SECURITY;

--
-- Name: spaces; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.spaces ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Avatar images are publicly accessible; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Avatar images are publicly accessible" ON storage.objects FOR SELECT USING ((bucket_id = 'avatars'::text));


--
-- Name: objects Model files are readable by everyone; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Model files are readable by everyone" ON storage.objects FOR SELECT USING (((bucket_id = 'model-files'::text) AND storage.validate_model_file_path(name) AND (EXISTS ( SELECT 1
   FROM public.models m
  WHERE (((m.id)::text = split_part(objects.name, '/'::text, 3)) AND ((NOT m.is_private) OR (m.author_id = auth.uid())))))));


--
-- Name: objects Users can delete their avatar images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can delete their avatar images" ON storage.objects FOR DELETE TO authenticated USING ((bucket_id = 'avatars'::text));


--
-- Name: objects Users can manage their model files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can manage their model files" ON storage.objects TO authenticated USING (((bucket_id = 'model-files'::text) AND storage.validate_model_file_path(name) AND (split_part(name, '/'::text, 1) = (auth.uid())::text) AND (EXISTS ( SELECT 1
   FROM public.models m
  WHERE (((m.id)::text = split_part(objects.name, '/'::text, 3)) AND (m.author_id = auth.uid()))))));


--
-- Name: objects Users can update their avatar images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can update their avatar images" ON storage.objects FOR UPDATE TO authenticated USING ((bucket_id = 'avatars'::text)) WITH CHECK ((bucket_id = 'avatars'::text));


--
-- Name: objects Users can upload avatar images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can upload avatar images" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'avatars'::text) AND (octet_length(decode("substring"(name, '[^.]+$'::text), 'escape'::text)) <= 2097152)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION create_file_changes(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_file_changes() TO anon;
GRANT ALL ON FUNCTION public.create_file_changes() TO authenticated;
GRANT ALL ON FUNCTION public.create_file_changes() TO service_role;


--
-- Name: FUNCTION generate_slug(title text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.generate_slug(title text) TO anon;
GRANT ALL ON FUNCTION public.generate_slug(title text) TO authenticated;
GRANT ALL ON FUNCTION public.generate_slug(title text) TO service_role;


--
-- Name: FUNCTION get_repo_type_from_path(path text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_repo_type_from_path(path text) TO anon;
GRANT ALL ON FUNCTION public.get_repo_type_from_path(path text) TO authenticated;
GRANT ALL ON FUNCTION public.get_repo_type_from_path(path text) TO service_role;


--
-- Name: FUNCTION handle_file_change_error(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_file_change_error() TO anon;
GRANT ALL ON FUNCTION public.handle_file_change_error() TO authenticated;
GRANT ALL ON FUNCTION public.handle_file_change_error() TO service_role;


--
-- Name: FUNCTION handle_github_oauth_callback(user_id uuid, gh_id text, gh_username text, gh_token text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_github_oauth_callback(user_id uuid, gh_id text, gh_username text, gh_token text) TO anon;
GRANT ALL ON FUNCTION public.handle_github_oauth_callback(user_id uuid, gh_id text, gh_username text, gh_token text) TO authenticated;
GRANT ALL ON FUNCTION public.handle_github_oauth_callback(user_id uuid, gh_id text, gh_username text, gh_token text) TO service_role;


--
-- Name: FUNCTION handle_model_commit(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_model_commit() TO anon;
GRANT ALL ON FUNCTION public.handle_model_commit() TO authenticated;
GRANT ALL ON FUNCTION public.handle_model_commit() TO service_role;


--
-- Name: FUNCTION handle_model_file_change(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_model_file_change() TO anon;
GRANT ALL ON FUNCTION public.handle_model_file_change() TO authenticated;
GRANT ALL ON FUNCTION public.handle_model_file_change() TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION handle_storage_change(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_storage_change() TO anon;
GRANT ALL ON FUNCTION public.handle_storage_change() TO authenticated;
GRANT ALL ON FUNCTION public.handle_storage_change() TO service_role;


--
-- Name: FUNCTION retry_operation(max_attempts integer, operation_name text, VARIADIC args text[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.retry_operation(max_attempts integer, operation_name text, VARIADIC args text[]) TO anon;
GRANT ALL ON FUNCTION public.retry_operation(max_attempts integer, operation_name text, VARIADIC args text[]) TO authenticated;
GRANT ALL ON FUNCTION public.retry_operation(max_attempts integer, operation_name text, VARIADIC args text[]) TO service_role;


--
-- Name: FUNCTION set_slug(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_slug() TO anon;
GRANT ALL ON FUNCTION public.set_slug() TO authenticated;
GRANT ALL ON FUNCTION public.set_slug() TO service_role;


--
-- Name: FUNCTION update_profile_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_profile_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_profile_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_profile_updated_at() TO service_role;


--
-- Name: FUNCTION update_repo_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_repo_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_repo_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_repo_updated_at() TO service_role;


--
-- Name: FUNCTION update_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at() TO service_role;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO service_role;


--
-- Name: FUNCTION validate_commit_message(message text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_commit_message(message text) TO anon;
GRANT ALL ON FUNCTION public.validate_commit_message(message text) TO authenticated;
GRANT ALL ON FUNCTION public.validate_commit_message(message text) TO service_role;


--
-- Name: FUNCTION validate_file_changes(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_file_changes() TO anon;
GRANT ALL ON FUNCTION public.validate_file_changes() TO authenticated;
GRANT ALL ON FUNCTION public.validate_file_changes() TO service_role;


--
-- Name: FUNCTION validate_file_path(path text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_file_path(path text) TO anon;
GRANT ALL ON FUNCTION public.validate_file_path(path text) TO authenticated;
GRANT ALL ON FUNCTION public.validate_file_path(path text) TO service_role;


--
-- Name: FUNCTION validate_model_file_change(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_model_file_change() TO anon;
GRANT ALL ON FUNCTION public.validate_model_file_change() TO authenticated;
GRANT ALL ON FUNCTION public.validate_model_file_change() TO service_role;


--
-- Name: FUNCTION validate_organization_entry(org jsonb); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_organization_entry(org jsonb) TO anon;
GRANT ALL ON FUNCTION public.validate_organization_entry(org jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.validate_organization_entry(org jsonb) TO service_role;


--
-- Name: FUNCTION validate_organizations(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_organizations() TO anon;
GRANT ALL ON FUNCTION public.validate_organizations() TO authenticated;
GRANT ALL ON FUNCTION public.validate_organizations() TO service_role;


--
-- Name: FUNCTION validate_space_type(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_space_type() TO anon;
GRANT ALL ON FUNCTION public.validate_space_type() TO authenticated;
GRANT ALL ON FUNCTION public.validate_space_type() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION extract_model_id(path text); Type: ACL; Schema: storage; Owner: postgres
--

GRANT ALL ON FUNCTION storage.extract_model_id(path text) TO anon;
GRANT ALL ON FUNCTION storage.extract_model_id(path text) TO authenticated;
GRANT ALL ON FUNCTION storage.extract_model_id(path text) TO service_role;


--
-- Name: FUNCTION validate_model_file_path(path text); Type: ACL; Schema: storage; Owner: postgres
--

GRANT ALL ON FUNCTION storage.validate_model_file_path(path text) TO anon;
GRANT ALL ON FUNCTION storage.validate_model_file_path(path text) TO authenticated;
GRANT ALL ON FUNCTION storage.validate_model_file_path(path text) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE auth_group; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_group TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_group TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_group TO service_role;


--
-- Name: SEQUENCE auth_group_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auth_group_id_seq TO anon;
GRANT ALL ON SEQUENCE public.auth_group_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.auth_group_id_seq TO service_role;


--
-- Name: TABLE auth_group_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_group_permissions TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_group_permissions TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_group_permissions TO service_role;


--
-- Name: SEQUENCE auth_group_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auth_group_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.auth_group_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.auth_group_permissions_id_seq TO service_role;


--
-- Name: TABLE auth_permission; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_permission TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_permission TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_permission TO service_role;


--
-- Name: SEQUENCE auth_permission_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auth_permission_id_seq TO anon;
GRANT ALL ON SEQUENCE public.auth_permission_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.auth_permission_id_seq TO service_role;


--
-- Name: TABLE auth_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user TO service_role;


--
-- Name: TABLE auth_user_groups; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user_groups TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user_groups TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user_groups TO service_role;


--
-- Name: SEQUENCE auth_user_groups_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auth_user_groups_id_seq TO anon;
GRANT ALL ON SEQUENCE public.auth_user_groups_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.auth_user_groups_id_seq TO service_role;


--
-- Name: SEQUENCE auth_user_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auth_user_id_seq TO anon;
GRANT ALL ON SEQUENCE public.auth_user_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.auth_user_id_seq TO service_role;


--
-- Name: TABLE auth_user_user_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user_user_permissions TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user_user_permissions TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.auth_user_user_permissions TO service_role;


--
-- Name: SEQUENCE auth_user_user_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auth_user_user_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.auth_user_user_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.auth_user_user_permissions_id_seq TO service_role;


--
-- Name: TABLE dataset_tags; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.dataset_tags TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.dataset_tags TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.dataset_tags TO service_role;


--
-- Name: TABLE datasets; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.datasets TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.datasets TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.datasets TO service_role;


--
-- Name: TABLE django_admin_log; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_admin_log TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_admin_log TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_admin_log TO service_role;


--
-- Name: SEQUENCE django_admin_log_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.django_admin_log_id_seq TO anon;
GRANT ALL ON SEQUENCE public.django_admin_log_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.django_admin_log_id_seq TO service_role;


--
-- Name: TABLE django_content_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_content_type TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_content_type TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_content_type TO service_role;


--
-- Name: SEQUENCE django_content_type_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.django_content_type_id_seq TO anon;
GRANT ALL ON SEQUENCE public.django_content_type_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.django_content_type_id_seq TO service_role;


--
-- Name: TABLE django_migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_migrations TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_migrations TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_migrations TO service_role;


--
-- Name: SEQUENCE django_migrations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.django_migrations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.django_migrations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.django_migrations_id_seq TO service_role;


--
-- Name: TABLE django_session; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_session TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_session TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.django_session TO service_role;


--
-- Name: TABLE guardian_groupobjectpermission; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.guardian_groupobjectpermission TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.guardian_groupobjectpermission TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.guardian_groupobjectpermission TO service_role;


--
-- Name: SEQUENCE guardian_groupobjectpermission_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.guardian_groupobjectpermission_id_seq TO anon;
GRANT ALL ON SEQUENCE public.guardian_groupobjectpermission_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.guardian_groupobjectpermission_id_seq TO service_role;


--
-- Name: TABLE guardian_userobjectpermission; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.guardian_userobjectpermission TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.guardian_userobjectpermission TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.guardian_userobjectpermission TO service_role;


--
-- Name: SEQUENCE guardian_userobjectpermission_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.guardian_userobjectpermission_id_seq TO anon;
GRANT ALL ON SEQUENCE public.guardian_userobjectpermission_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.guardian_userobjectpermission_id_seq TO service_role;


--
-- Name: TABLE model_commits; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_commits TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_commits TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_commits TO service_role;


--
-- Name: TABLE model_file_changes; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_file_changes TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_file_changes TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_file_changes TO service_role;


--
-- Name: TABLE model_tags; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_tags TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_tags TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.model_tags TO service_role;


--
-- Name: TABLE models; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.models TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.models TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.models TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.profiles TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.profiles TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.profiles TO service_role;


--
-- Name: TABLE repo; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.repo TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.repo TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.repo TO service_role;


--
-- Name: TABLE space_tags; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.space_tags TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.space_tags TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.space_tags TO service_role;


--
-- Name: TABLE spaces; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.spaces TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.spaces TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.spaces TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.messages TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

