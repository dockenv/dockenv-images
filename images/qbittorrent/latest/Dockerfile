FROM ghcr.io/dockenv/alpine:latest
LABEL org.opencontainers.image.title="qBittorrent" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a bittorrent client'

COPY conf/qBittorrent.conf /root/.config/qBittorrent/

RUN apk add --no-cache qbittorrent-nox

VOLUME [ "/data" ]

# 8080 qBittorrent UI
# 59000 tracker
EXPOSE 8080 59000 56459

CMD ["qbittorrent-nox"]
