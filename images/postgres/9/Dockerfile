FROM postgres:9-alpine3.14

LABEL org.opencontainers.image.title="PostgreSQL" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='PostgreSQL 10'

ENV PGDATA /var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

ENTRYPOINT ["docker-entrypoint.sh"]
STOPSIGNAL SIGINT
EXPOSE 5432
CMD ["postgres"]
