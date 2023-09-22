FROM percona:5.7

LABEL org.opencontainers.image.title="Percona" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
      org.opencontainers.image.description='Percona 5.7'

VOLUME ["/var/lib/mysql", "/var/log/mysql"]

USER mysql
EXPOSE 3306 33060
CMD ["mysqld"]
