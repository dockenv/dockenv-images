FROM haproxy:latest

LABEL org.opencontainers.image.title="HAProxy" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='HAProxy latest version'

STOPSIGNAL SIGUSR1
USER haproxy
EXPOSE 80
WORKDIR /var/lib/haproxy
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
