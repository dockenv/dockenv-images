FROM postgres:15-alpine

LABEL org.opencontainers.image.title="PostgreSQL" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='PostgreSQL 15'

VOLUME /var/lib/postgresql/data

ENTRYPOINT ["docker-entrypoint.sh"]

STOPSIGNAL SIGINT

EXPOSE 5432

CMD ["postgres"]
