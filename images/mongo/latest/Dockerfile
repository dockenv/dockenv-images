FROM mongo:latest

LABEL org.opencontainers.image.title="MongoDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Document databases provide high availability and easy scalability.'

# ensure that if running as custom user that "mongosh" has a valid "HOME"
# https://github.com/docker-library/mongo/issues/524
ENV HOME /data/db

VOLUME /data/db /data/configdb
EXPOSE 27017
CMD ["mongod"]
