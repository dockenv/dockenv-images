FROM docker.elastic.co/beats/filebeat:7.17.21

LABEL org.opencontainers.image.title="Filebeat" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='🐠 Beats - Lightweight shippers for Elasticsearch & Logstash'

EXPOSE 5601
CMD [ "/usr/bin/tini" "--" "/usr/local/bin/docker-entrypoint"]
