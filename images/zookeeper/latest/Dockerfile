FROM zookeeper:latest

LABEL MAINTAINER="Cloudflying" \
    MAIL="<oss@live.hk>" \
    org.opencontainers.image.source=https://github.com/dockenv/dockenv-images \
    org.opencontainers.image.description="Zookeeper Docker Images"

# ZOO_CONF_DIR=/conf
VOLUME ["/data", "/datalog", "/logs"]

EXPOSE 2181 2888 3888 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]
