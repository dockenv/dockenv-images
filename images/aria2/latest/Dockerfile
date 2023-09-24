FROM ghcr.io/dockenv/alpine:latest
LABEL org.opencontainers.image.title="Aria2" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a lightweight multi-protocol & multi-source, cross platform download utility operated in command-line. It supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink.'

COPY conf/ /etc/aria2c/

RUN apk add --no-cache aria2 \
    && mkdir -p /etc/aria2c \
    && mkdir -p /data/downloads \
    && chmod -R 777 /etc/aria2c /data/downloads \
    && mv /etc/aria2c/entrypoint.sh /usr/bin/entrypoint.sh \
    && chmod +x /usr/bin/entrypoint.sh

# 6080 Aria2
# 6802-6999 DOT Port
EXPOSE 6080 6881-6999

CMD ["/usr/bin/entrypoint.sh"]
