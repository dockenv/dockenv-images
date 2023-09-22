FROM imxieke/alpine:latest

LABEL org.opencontainers.image.title="Rsync" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Rsync Syncing File Tools'

RUN apk update && \
    apk add --no-cache rsync && \
    rm -fr /var/cache/apk/*

CMD [ "/bin/sh" ]
