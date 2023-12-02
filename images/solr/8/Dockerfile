FROM solr:8-slim
LABEL org.opencontainers.image.title="Solr" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Apache Solr is the popular, blazing-fast, open source search platform built on Apache Lucene™.'

VOLUME /var/solr
EXPOSE 8983
WORKDIR /opt/solr
USER solr

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["solr-foreground"]
