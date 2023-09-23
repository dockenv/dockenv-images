# hadolint ignore=DL3007
FROM elixir:alpine
LABEL org.opencontainers.image.title="Elixir" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Elixir is a dynamic, functional language for building scalable and maintainable applications.'

VOLUME ["/data"]

EXPOSE 22 3000

CMD ["/bin/s6-svscan", "/etc/s6"]
