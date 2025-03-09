FROM qdrant/qdrant:latest

LABEL org.opencontainers.image.title="Qdrant " \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='igh-performance, massive-scale Vector Database and Vector Search Engine for the next generation of AI.'

ENV TZ=Asia/Shanghai \
  RUN_MODE=production

EXPOSE 6333
EXPOSE 6334

CMD ["/qdrant/entrypoint.sh"]
