FROM ghcr.io/dockenv/alpine:edge
LABEL org.opencontainers.image.title="Squid Proxy Cache" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Full-featured Web Proxy Cache Server'

RUN apk add --no-cache squid

# 3128 HTTP Port
# 3130 ICP Port
EXPOSE 3128 3130
CMD squid && tail -f /var/log/squid/*.log
