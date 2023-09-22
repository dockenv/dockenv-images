FROM redis:6.0-alpine

LABEL org.opencontainers.image.title="Redis" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
      org.opencontainers.image.description='Redis 6.0'

USER redis

VOLUME /data
WORKDIR /data

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server"]
