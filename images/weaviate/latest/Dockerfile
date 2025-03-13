FROM semitechnologies/weaviate
LABEL org.opencontainers.image.title="Weaviate" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Weaviate is an open-source vector database that simplifies the development of AI applications.'

ENTRYPOINT ["/bin/weaviate"]
CMD [ "--host", "0.0.0.0", "--port", "8080", "--scheme", "http"]