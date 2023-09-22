FROM golang:1.17-alpine

LABEL org.opencontainers.image.title="Golang" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Golang 1.17'

ENV GOPATH /go
ENV GOBIN ${GOPATH}/bin
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN

CMD [ "/bin/sh" ]
