FROM mariadb:10.6

LABEL org.opencontainers.image.title="Mariadb" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Mariadb 10.6'

VOLUME /var/lib/mysql

EXPOSE 3306
CMD ["mariadbd"]
