FROM ghcr.io/dockenv/alpine:latest

LABEL org.opencontainers.image.title="Aria2" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.url="https://dockenv.github.io" \
  org.opencontainers.image.description='A lightweight multi-protocol & multi-source, cross platform download utility operated in command-line. It supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink.'

ENV TZ="Asia/Shanghai"

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY conf /etc/aria2c

RUN apk add --no-cache dufs aria2 unzip \
  && mkdir -p /etc/aria2c /data/downloads /data/logs /var/www \
  && chmod -R 777 /etc/aria2c /var/www \
  && chmod +x /usr/bin/entrypoint.sh \
  && ARIANG_VER=$(wget -qO- https://api.github.com/repos/mayswind/AriaNg/tags | grep 'name' | cut -d\" -f4 | head -1) \
  && wget -P /tmp https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VER}/AriaNg-${ARIANG_VER}-AllInOne.zip \
  && unzip /tmp/AriaNg-${ARIANG_VER}-AllInOne.zip -d /var/www \
  && rm -fr /var/www/LICENSE \
  && apk del unzip


WORKDIR /data/downloads

# 6800 Aria2
# 6881-6999 DOT Port
# 8080 Web UI
EXPOSE 6800 6881-6999 8080

CMD ["/usr/bin/entrypoint.sh"]
