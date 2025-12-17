FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/debian:trixie

LABEL org.opencontainers.image.title="Debian GNU Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Debian GNU Linux latest version'

ARG DEBIAN_FRONTEND noninteractive
ENV PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

RUN apt update -y \
  && apt install -y lsb-release ca-certificates apt-transport-https software-properties-common apt-utils

CMD ["/bin/bash"]
