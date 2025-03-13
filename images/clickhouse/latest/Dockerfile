FROM clickhouse:lts
LABEL org.opencontainers.image.title="ClickHouse" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='ClickHouse® is a real-time analytics database management system'

ENV TZ=Asia/Shanghai
ENV CLICKHOUSE_CONFIG=/etc/clickhouse-server/config.xml

EXPOSE 9000 8123 9009
VOLUME /var/lib/clickhouse


ENTRYPOINT ["/entrypoint.sh"]