FROM ghcr.io/dockenv/alpine:3.20

LABEL org.opencontainers.image.title="Shadowsocks" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Proxy Client && Server'

COPY entrypoint.sh /bin/entrypoint.sh
COPY shadowsocks.json /etc/shadowsocks.json

ENV SHADOWSOCKS_VER="1.21.2"

RUN wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v${SHADOWSOCKS_VER}/shadowsocks-v${SHADOWSOCKS_VER}.x86_64-unknown-linux-musl.tar.xz -O /tmp/shadowsocks.tar.xz \
    && tar -xf /tmp/shadowsocks.tar.xz -C /tmp \
    && mv /tmp/ssserver /usr/bin/ssserver \
    && chmod +x /usr/bin/ssserver \
    && chmod +x /bin/entrypoint.sh \
    && rm -fr /tmp/*

CMD [ "/bin/entrypoint.sh" ]