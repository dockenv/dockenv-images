FROM redis:7.0-alpine

LABEL MAINTAINER="Cloudflying" \
    MAIL="<oss@live.hk>" \
    org.opencontainers.image.source=https://github.com/dockenv/dockenv \
    org.opencontainers.image.description="Redis Docker Images"

USER redis

VOLUME /data
WORKDIR /data

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server"]
