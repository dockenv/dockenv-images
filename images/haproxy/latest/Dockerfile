FROM haproxy:alpine

LABEL org.opencontainers.image.title="HAProxy" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='The Reliable, High Performance TCP/HTTP Load Balancer'

STOPSIGNAL SIGUSR1
USER haproxy
EXPOSE 80
WORKDIR /var/lib/haproxy

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
