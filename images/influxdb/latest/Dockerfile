FROM influxdb:alpine

LABEL org.opencontainers.image.title="HAProxy" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='HAProxy latest version'

VOLUME /var/lib/influxdb2 /etc/influxdb2
EXPOSE 8086
CMD ["influxd"]
