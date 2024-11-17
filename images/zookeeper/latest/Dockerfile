FROM zookeeper:latest

LABEL org.opencontainers.image.title="ZooKeeper" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
    org.opencontainers.image.description="Apache ZooKeeper is an open-source server which enables highly reliable distributed coordination."

# ZOO_CONF_DIR=/conf
VOLUME ["/data", "/datalog", "/logs"]

EXPOSE 2181 2888 3888 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]
