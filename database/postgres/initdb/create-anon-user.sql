-- try to create a new user called annon
-- if it already exists, then drop it and create it again
DO $$
BEGIN
    CREATE USER anon;
EXCEPTION
    WHEN duplicate_object THEN
        DROP USER anon;
        CREATE USER anon;
END

$$;

-- grant usage on the public schema to anon
GRANT USAGE ON SCHEMA public TO anon;

-- grant select on all tables in the public schema to anon
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO anon;

-- grant select on all sequences in the public schema to anon
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO anon;

-- grant select on all tables in the public schema to anon
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon;

