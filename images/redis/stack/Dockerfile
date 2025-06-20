FROM redis/redis-stack:latest
LABEL org.opencontainers.image.title="Redis Stack" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.description='redis-stack installs a Redis server with additional database capabilities and the RedisInsight.'

RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf

USER redis

VOLUME /data
WORKDIR /data

# Redis Stack server 10001
# RedisInsight 13333
EXPOSE 6379 8001 10001 13333
CMD ['/entrypoint.sh']
