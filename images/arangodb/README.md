# ArangoDB

> 🥑 ArangoDB is a native multi-model database with flexible data models for documents, graphs, and key-values


## Usage
```shell
docker run -d \
    --name arangodb-instance \
    -p 8529:8529 \
    -v /apth/to/arangodb:/var/lib/arangodb3 #  persistent files
    -e ARANGO_RANDOM_ROOT_PASSWORD=1 \ # conflict with `ARANGO_ROOT_PASSWORD`
    -e ARANGO_ROOT_PASSWORD=dockpass \ # optional
    ghcr.io/dockenv/arangodb:latest
```