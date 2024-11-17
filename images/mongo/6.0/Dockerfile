FROM mongo:6.0-jammy

LABEL org.opencontainers.image.title="MongoDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Document databases provide high availability and easy scalability.'

VOLUME /data/db /data/configdb
EXPOSE 27017
CMD ["mongod"]
