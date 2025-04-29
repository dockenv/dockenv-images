FROM elasticsearch:8.18.0

LABEL org.opencontainers.image.title="Elasticsearch" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Elasticsearch is a powerful open source search and analytics engine that makes data easy to explore.'

EXPOSE 9200 9300

USER 1000

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["eswrapper"]
