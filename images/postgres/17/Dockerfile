FROM postgres:17-alpine

LABEL org.opencontainers.image.title="PostgreSQL" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='PostgreSQL 16'

VOLUME /var/lib/postgresql/data

ENTRYPOINT ["docker-entrypoint.sh"]

STOPSIGNAL SIGINT

EXPOSE 5432

CMD ["postgres"]
