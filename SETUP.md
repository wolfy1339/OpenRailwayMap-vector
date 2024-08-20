# Setup

```sh
apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    osm2pgsql \
    osmium-tool \
    gdal-bin \
    python3-psycopg2 \
    python3-yaml \
    python3-requests \
    unzip \
    postgresql-client \
    cargo \
    git \
    nginx
```
Get node from https://github.com/nodesource/distributions

Edit `/etc/postgresql/16/main/pg_hba.conf`:
Change the following:
```
local   all             postgres                                peer
```
to
```
local   all             postgres                                trust
```

```sh
POSTGRES_USER="postgres" ./db/tune-postgis.sh
cargo install cargo-binstall template
cargo binstall martin
export PATH=$PATH:~/.cargo/bin/
cat features/electrification_signals.yaml features/speed_railway_signals.yaml features/train_protection.yaml features/signals_railway_signals.yaml \
  | template --configuration - --format yaml --template import/openrailwaymap.lua.tmpl \
  > import/openrailwaymap.lua
cat features/electrification_signals.yaml features/signals_railway_signals.yaml features/speed_railway_signals.yaml \
  | template --configuration - --format yaml --template import/sql/tile_views.sql.tmpl \
  > import/sql/tile_views.sql
```

## Fetching data

Download an OpenStreetMap data file, for example from https://download.geofabrik.de/europe.html. Store the file as `data/data.osm.pbf` (you can customize the filename with `OSM2PGSQL_DATAFILE`).

```sh
curl http://download.geofabrik.de/north-america-latest.osm.pbf -o data/data.osm.pbf
```

## Development

Import the data:
```shell
./import/docker-startup.sh import
```
The import process will filter the file before importing it. The filtered file will be stored in the `data/filtered` directory, so future imports of the same data file can reuse the filtered data file.

Start the tile server:
```shell
docker compose up --build martin
```

Prepare and start the API:
```shell
api/prepare-api.sh
docker compose up api
```

Start the web server:
```shell
docker compose up --build martin-proxy
```

The OpenRailwayMap is now available on http://localhost:8000.

To ease development, Docker Compose can automatically rebuild containers when dependent files change. Enable *watch mode* with:
```shell
docker compose watch
```

## Deployment

Import the data:
```shell
docker compose run --build import import
```

Build the tiles:
```shell
export BBOX='-190.2,11.8,-45.0,83.9'
for tile in low-med high standard speed signals electrification; do
    env "TILES=$tile" docker compose up martin-cp
done
```

Build and deploy the tile server:
```shell
flyctl deploy --config martin-static.fly.toml --local-only
```

Build and deploy the API:
```shell
api/prepare-api.sh
flyctl deploy --config api.fly.toml --local-only api
```

Build and deploy the caching proxy:
```shell
flyctl deploy --config proxy.fly.toml --local-only
```

The OpenRailwayMap is now available on https://openrailwaymap.fly.dev.
