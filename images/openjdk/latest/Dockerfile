FROM eclipse-temurin:latest

LABEL org.opencontainers.image.title="OpenJDK" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://github.com/dockenv" \
      org.opencontainers.image.description='OpenJDK binaries built by Eclipse Temurin.'

ENTRYPOINT ["/__cacert_entrypoint.sh"]

CMD ["jshell"]