FROM redis/redis-stack:edge
LABEL org.opencontainers.image.title="Redis Stack" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='redis-stack installs a Redis server with additional database capabilities and the RedisInsight.'

USER redis

VOLUME /data
WORKDIR /data

EXPOSE 6379 8001
CMD ['/entrypoint.sh']
