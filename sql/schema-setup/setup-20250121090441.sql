-- Create liquibase user
CREATE USER liquibase_user WITH PASSWORD 'change-password-here';
ALTER USER liquibase_user CREATEDB;

-- Grant database connection
GRANT CONNECT ON DATABASE defaultdb TO liquibase_user;

-- Create schemas
CREATE SCHEMA IF NOT EXISTS schema1;
CREATE SCHEMA IF NOT EXISTS schema2;

-- Grant permissions on public schema (enhanced permissions)
GRANT USAGE, CREATE ON SCHEMA public TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO liquibase_user;
GRANT CREATE ON SCHEMA public TO liquibase_user;
ALTER USER liquibase_user SET search_path TO public;

-- Grant permissions on schema1
GRANT USAGE, CREATE ON SCHEMA schema1 TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA schema1 TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA schema1 TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA schema1 TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA schema1 GRANT ALL ON TABLES TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA schema1 GRANT ALL ON SEQUENCES TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA schema1 GRANT ALL ON FUNCTIONS TO liquibase_user;

-- Grant permissions on schema2
GRANT USAGE, CREATE ON SCHEMA schema2 TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA schema2 TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA schema2 TO liquibase_user;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA schema2 TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA schema2 GRANT ALL ON TABLES TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA schema2 GRANT ALL ON SEQUENCES TO liquibase_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA schema2 GRANT ALL ON FUNCTIONS TO liquibase_user;