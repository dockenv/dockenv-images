FROM yugabytedb/yugabyte:2024.1.6.1-b2
LABEL org.opencontainers.image.title="Yugabyte DB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='The high-performance distributed SQL database for global, internet-scale apps.'

EXPOSE 7000 7100 7200 9000 9100 12000 11000 6379 9042 5433 10100

VOLUME ["/mnt/disk0", "/mnt/disk1"]

ENTRYPOINT ["/sbin/tini", "--"]