FROM redis:8.0-rc1-alpine

LABEL org.opencontainers.image.title="Redis" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Redis is the world’s fastest data platform for caching, vector search, and NoSQL databases.'

USER redis

VOLUME /data
WORKDIR /data

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server"]
