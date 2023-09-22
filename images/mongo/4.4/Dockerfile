FROM mongo:4.4

LABEL org.opencontainers.image.title="MongoDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='MongoDB 4.4'

VOLUME /data/db /data/configdb

EXPOSE 27017
CMD ["mongod"]
