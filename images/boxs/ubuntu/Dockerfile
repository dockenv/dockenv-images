FROM ghcr.io/dockenv/ubuntu:latest

LABEL MAINTAINER="Cloudflying" \
  MAIL="oss@live.hk" \
  org.opencontainers.image.source=https://github.com/dockenv/dockenv \
  org.opencontainers.image.description='Ubuntu Boxs'

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
  apt update && \
  apt install -y git zsh neovim openssh-server && \
  mkdir -p /run/sshd && \
  apt autoremove -y && \
  apt-get autoclean -y && \
  rm -fr /var/lib/apt/lists/*

EXPOSE 80 22

CMD /usr/sbin/sshd -D
