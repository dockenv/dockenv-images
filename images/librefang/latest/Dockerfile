FROM ghcr.io/librefang/librefang:latest

LABEL org.opencontainers.image.title="Librefang" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.description='Open-source Agent OS built in Rust.'

EXPOSE 4545
ENV LIBREFANG_HOME=/data
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["librefang", "start", "--foreground"]