FROM ghcr.io/dockenv/ubuntu:24.04
LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini-amd64 /usr/bin/tini

RUN apt update -y \
  && apt upgrade -y \
  && apt install -y wget curl \
  && apt autoremove -y \
  && apt-get autoclean -y \
  && rm -fr /var/lib/apt/lists/*

CMD ["bash"]
