FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/alpine:latest

LABEL org.opencontainers.image.title="Shadowsocks Server" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='shadowsocks is a fast tunnel proxy that helps you bypass firewalls.'

COPY entrypoint.sh /bin/entrypoint.sh

RUN apk add --virtual .deps curl \
    && VERSION=$(curl -fsSLI -o /dev/null -w "%{url_effective}" "https://github.com/shadowsocks/shadowsocks-rust/releases/latest" | awk -F 'tag/v' '{print $2}') \
    && wget "https://github.com/shadowsocks/shadowsocks-rust/releases/download/v${VERSION}/shadowsocks-v${VERSION}.x86_64-unknown-linux-musl.tar.xz" -O /tmp/shadowsocks.tar.xz \
    && tar -xf /tmp/shadowsocks.tar.xz -C /tmp \
    && mv /tmp/ssserver /usr/bin/ssserver \
    && chmod +x /usr/bin/ssserver \
    && chmod +x /bin/entrypoint.sh \
    && rm -fr /tmp/* \
    && apk del .deps

EXPOSE 6443/udp 6443/tcp

CMD [ "/bin/entrypoint.sh" ]