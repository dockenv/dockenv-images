FROM adguard/adguardhome:latest
LABEL org.opencontainers.image.title="AdGuard DNS Proxy" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='A simple DNS proxy server that supports all existing DNS protocols.'

COPY AdGuardHome.yaml /opt/adguardhome/conf/AdGuardHome.yaml

# 53     : TCP, UDP : DNS
# 80     : TCP      : HTTP
# 443    : TCP, UDP : HTTPS, DNS-over-HTTPS (incl. HTTP/3), DNSCrypt (main)
# 853    : TCP, UDP : DNS-over-TLS, DNS-over-QUIC
# 5443   : TCP, UDP : DNSCrypt (alt)
# 6060   : TCP      : HTTP (pprof)
EXPOSE 53/tcp 53/udp \
       80/tcp \
       443/tcp 443/udp \
       853/tcp 853/udp \
       5443/tcp 5443/udp \
       6060/tcp

WORKDIR /opt/dnsproxy

ENTRYPOINT ["/opt/dnsproxy/dnsproxy"]
CMD ["--config-path=/opt/dnsproxy/config.yaml"]