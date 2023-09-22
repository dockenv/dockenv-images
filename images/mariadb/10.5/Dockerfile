FROM mariadb:10.5

LABEL org.opencontainers.image.title="Mariadb" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Mariadb 10.5'

VOLUME /var/lib/mysql

EXPOSE 3306
CMD ["mariadbd"]
