## Usage
```bash
docker run --rm \
    --name postgres \
    -e POSTGRES_USER=dockenv\
    -e POSTGRES_PASSWORD=dockenv\
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /custom/mount:/var/lib/postgresql/data \
    ghcr.io/dockenv/postgreslatest
```


## TODO
- https://hub.docker.com/r/postgis/postgis