FROM percona:psmdb-6.0

LABEL org.opencontainers.image.title="Percona Server for MongoDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Percona Server for MongoDB latest'

VOLUME ["/data/db"]

USER 1001
EXPOSE 27017
CMD ["mongod"]
