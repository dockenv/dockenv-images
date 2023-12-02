FROM getmeili/meilisearch:latest

LABEL org.opencontainers.image.title="meilisearch" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='An open-source, fast, and hyper-relevant search engine that fits effortlessly into your projects.'

ENV MEILI_HTTP_ADDR 0.0.0.0:7700
ENV MEILI_SERVER_PROVIDER docker

WORKDIR /meili_data

EXPOSE  7700/tcp

ENTRYPOINT ["tini", "--"]
CMD /bin/meilisearch
