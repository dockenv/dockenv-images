FROM ghcr.io/dockenv/alpine:3.20


LABEL org.opencontainers.image.title="Chrony" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.url="https://dockenv.github.io" \
  org.opencontainers.image.description='chrony is a versatile implementation of the Network Time Protocol (NTP).'

RUN apk add --no-cache chrony

CMD ["ntpd", "-u", "chrony", "-d"]