FROM varnish:alpine
LABEL org.opencontainers.image.title="Varnish" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='An HTTP accelerator designed for content-heavy dynamic web sites as well as APIs.'

USER varnish
EXPOSE 80 8443

ENTRYPOINT ["/usr/local/bin/docker-varnish-entrypoint"]
