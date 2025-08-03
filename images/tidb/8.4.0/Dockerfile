FROM pingcap/tidb:v8.4.0

LABEL org.opencontainers.image.title="TiDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='TiDB - the open-source, cloud-native, distributed SQL database designed for modern applications.'

WORKDIR /
EXPOSE 4000
ENTRYPOINT ["/tidb-server"]