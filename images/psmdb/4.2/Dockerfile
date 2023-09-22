FROM percona:psmdb-4.2

LABEL org.opencontainers.image.title="Percona Server for MongoDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
      org.opencontainers.image.description='Percona Server for MongoDB 4.2'

VOLUME ["/data/db"]

USER 1001
EXPOSE 27017
CMD ["mongod"]
