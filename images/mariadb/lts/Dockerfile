FROM mariadb:lts

LABEL org.opencontainers.image.title="Mariadb" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
      org.opencontainers.image.description='Mariadb LTS'

VOLUME /var/lib/mysql

EXPOSE 3306
CMD ["mariadbd"]
