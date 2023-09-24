# hadolint ignore=DL3007
FROM ghcr.io/dockenv/alpine:latest
LABEL org.opencontainers.image.title="Seedbox" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='seedbox: Torrent Downloader, File Viewer'

ENV ARIA2_USER='dockenv' \
    ARIA2_PWD='dockenv' \
    ENABLE_AUTH=true

COPY conf /conf

RUN sh /conf/init.sh \
    && rm -fr /tmp/*

VOLUME [ "/data" ]

USER dockenv
WORKDIR /home/dockenv

EXPOSE 80 6800 6881/tcp 6881/udp
# Deluge
EXPOSE 8112 58846 58946 58946/udp
# JellyFin
EXPOSE 8096 8920
# mylar3
EXPOSE 8090

# dht qbittorrent
EXPOSE 6881

CMD ["/usr/bin/entrypoint.sh"]
