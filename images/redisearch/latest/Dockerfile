FROM redislabs/redisearch:latest

LABEL org.opencontainers.image.title="RediSearch" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
      org.opencontainers.image.description='RediSearch latest'

EXPOSE 6379

CMD ["redis-server", "--loadmodule", "/usr/lib/redis/modules/redisearch.so"]
