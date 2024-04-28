## Usage

```bash
docker run \
    -e COUCHDB_USER=dockenv \
    -e COUCHDB_PASSWORD=dockenv \
    -v /home/couchdb/data:/opt/couchdb/data \
    -v /home/couchdb/etc:/opt/couchdb/etc/local.d \
    -d ghcr.io/dockenv/couchdb:latest
```