FROM couchdb:3.2

LABEL org.opencontainers.image.title="Couchdb" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='CouchDB is a database that uses JSON for documents, an HTTP API, & JavaScript/declarative indexing.'

EXPOSE 5984 4369 9100
VOLUME /opt/couchdb/data
CMD ["/opt/couchdb/bin/couchdb"]
