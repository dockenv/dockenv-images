FROM redis/redis-stack-server:latest
LABEL org.opencontainers.image.title="Redis Stack" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.description='redis-stack-server installs a Redis server with additional database capabilities.'

RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf

USER redis

VOLUME /data
WORKDIR /data

EXPOSE 6379
CMD ['/entrypoint.sh']
