FROM varnish:alpine
LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk" \
        org.opencontainers.image.source=https://github.com/dockenv/dockenv

USER varnish
EXPOSE 80 8443

ENTRYPOINT ["/usr/local/bin/docker-varnish-entrypoint"]
