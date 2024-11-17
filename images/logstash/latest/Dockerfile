FROM logstash:8.16.0

LABEL org.opencontainers.image.title="Logstash" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a tool for managing events and logs.'

USER 1000

EXPOSE 9600 5044
ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
