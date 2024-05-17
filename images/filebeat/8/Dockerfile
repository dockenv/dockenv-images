FROM docker.elastic.co/beats/filebeat:8.13.4

LABEL org.opencontainers.image.title="Kibana" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='🐠 Beats - Lightweight shippers for Elasticsearch & Logstash'

CMD [ "/usr/bin/tini" "--" "/usr/local/bin/docker-entrypoint"]
