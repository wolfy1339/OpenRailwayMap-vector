#!/usr/bin/env bash

set -e

export PGUSER="$POSTGRES_USER"

echo "Creating default database"
psql -c "SELECT 1 FROM pg_database WHERE datname = 'gis';" | grep -q 1 || createdb gis
psql -c 'CREATE EXTENSION IF NOT EXISTS postgis;'
psql -c 'CREATE EXTENSION IF NOT EXISTS hstore;'
psql -c 'DROP EXTENSION IF EXISTS postgis_topology;'
psql -c 'DROP EXTENSION IF EXISTS fuzzystrmatch;'
psql -c 'DROP EXTENSION IF EXISTS postgis_tiger_geocoder;'

psql -d gis -f /sql/facility_functions.sql
psql -d gis -f /sql/import.sql
