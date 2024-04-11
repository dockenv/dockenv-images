FROM ghcr.io/dockenv/alpine:3.19

LABEL org.opencontainers.image.title="Node" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.description='Node 20'

RUN apk add --no-cache nodejs-current npm yarn

CMD [ "node" ]
