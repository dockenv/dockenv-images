FROM golang:1.20-alpine

LABEL org.opencontainers.image.title="Golang" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://github.com/dockenv" \
      org.opencontainers.image.description='a general purpose, higher-level, imperative programming language.'

ENV GOPATH /go
ENV GOBIN ${GOPATH}/bin
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN

CMD [ "/bin/sh" ]
