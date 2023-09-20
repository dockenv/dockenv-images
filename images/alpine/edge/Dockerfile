FROM alpine:edge

LABEL org.opencontainers.image.title="Alpine Linux" \
        org.opencontainers.image.vendor="Cloudflying <oss@live.hk>" \
        org.opencontainers.image.source="https://github.com/imxieke/dockenv-images" \
        org.opencontainers.image.description='Alpine Linux edge'

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

CMD [ "/bin/sh" ]
