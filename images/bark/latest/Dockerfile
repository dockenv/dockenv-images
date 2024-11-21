FROM alpine:3.4
LABEL org.opencontainers.image.title="Bark" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Bark is an iOS App which allows you to push custom notifications to your iPhone.'

VOLUME /data

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bark-server"]