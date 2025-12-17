## Usage
```bash
docker run --rm \
    --name postgres \
    -e POSTGRES_USER=dockenv\
    -e POSTGRES_PASSWORD=dockenv\
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /custom/mount:/var/lib/postgresql/data \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/postgres:latest
```

## Variable
- POSTGRES_PASSWORD
- POSTGRES_USER
- POSTGRES_DB define a different name for the default database that is created when the image is first started.
- POSTGRES_INITDB_ARGS `-e POSTGRES_INITDB_ARGS="--data-checksums"`
- POSTGRES_HOST_AUTH_METHOD default `md5`, options: `md5 scram-sha-256 password trust`
  - `echo "host all all all $POSTGRES_HOST_AUTH_METHOD" >> pg_hba.conf`
  - trust will ignore password login
  - `password` is clear-text

## TODO
- https://hub.docker.com/r/postgis/postgis