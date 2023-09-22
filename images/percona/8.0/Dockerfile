FROM percona:8.0

LABEL org.opencontainers.image.title="Percona" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Percona 8.0'

VOLUME ["/var/lib/mysql", "/var/log/mysql"]

USER mysql
EXPOSE 3306 33060
CMD ["mysqld"]
