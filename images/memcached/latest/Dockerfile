FROM memcached:alpine

LABEL org.opencontainers.image.title="Memcached" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Memcached latest'

USER memcache
EXPOSE 11211
CMD ["memcached"]
