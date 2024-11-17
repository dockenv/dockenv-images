FROM kibana:7.17.25

LABEL org.opencontainers.image.title="Kibana" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Kibana gives shape to any kind of data — structured and unstructured — indexed in Elasticsearch.'

EXPOSE 5601
ENTRYPOINT ["/bin/tini", "--"]
CMD ["/usr/local/bin/kibana-docker"]