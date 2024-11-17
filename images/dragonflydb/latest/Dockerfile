FROM ghcr.io/dragonflydb/dragonfly:latest
LABEL org.opencontainers.image.title="DragonflyDB" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='The fastest in-memory data store for high-performance applications.'

VOLUME /data
WORKDIR /data

HEALTHCHECK CMD /usr/local/bin/healthcheck.sh
ENTRYPOINT ["entrypoint.sh"]

# For inter-container communication.
EXPOSE 6379

CMD ["dragonfly", "--logtostderr"]