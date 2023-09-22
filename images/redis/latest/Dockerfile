FROM redis:alpine

LABEL org.opencontainers.image.title="Redis" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
      org.opencontainers.image.description='Redis latest'

USER redis

VOLUME /data
WORKDIR /data

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server"]
