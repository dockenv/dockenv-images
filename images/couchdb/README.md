# [CouchDB](https://hub.docker.com/_/percona)

> CouchDB is a database that uses JSON for documents, an HTTP API, & JavaScript/declarative indexing.

## Usage

```bash
docker run \
    -e COUCHDB_USER=dockenv \
    -e COUCHDB_PASSWORD=dockenv \
    -v /home/couchdb/data:/opt/couchdb/data \
    -v /home/couchdb/etc:/opt/couchdb/etc/local.d \
    -p 5984:5984 \
    -d ghcr.io/dockenv/couchdb:latest
```