FROM ghcr.io/dockenv/alpine:latest

LABEL org.opencontainers.image.title="Node" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
      org.opencontainers.image.description='Node latest version'

RUN apk add --no-cache nodejs-current npm yarn

CMD [ "node" ]
