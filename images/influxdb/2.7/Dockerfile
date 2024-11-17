FROM influxdb:2.7-alpine

LABEL org.opencontainers.image.title="InfluxDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='the open source time series database built for real-time analytic workloads.'

EXPOSE 8086
VOLUME /var/lib/influxdb2 /etc/influxdb2
USER influxdb
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]