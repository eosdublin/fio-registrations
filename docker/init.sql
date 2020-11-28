CREATE USER fio;
ALTER ROLE fio WITH PASSWORD 'password';

CREATE DATABASE "fio-registrations";
ALTER DATABASE "fio-registrations" SET timezone TO 'UTC';

GRANT ALL PRIVILEGES ON DATABASE "fio-registrations" TO fio;
