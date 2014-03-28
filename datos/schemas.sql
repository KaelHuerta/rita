CREATE SCHEMA IF NOT EXISTS dirty;
CREATE SCHEMA IF NOT EXISTS clean;
CREATE SCHEMA IF NOT EXISTS alfie;
CREATE SCHEMA IF NOT EXISTS ts;
CREATE SCHEMA IF NOT EXISTS grafo;

CREATE EXTENSION file_fdw;
CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw;

CREATE EXTENSION fuzzystrmatch;

GRANT usage ON SCHEMA dirty TO public;

ALTER default privileges IN SCHEMA dirty
GRANT select, references ON tables
  TO public;

ALTER default privileges IN SCHEMA dirty
GRANT select, update ON sequences
  TO public;

ALTER default privileges IN SCHEMA dirty
GRANT execute ON functions
  TO public;

ALTER default privileges IN SCHEMA dirty
GRANT usage ON types
  TO public;
