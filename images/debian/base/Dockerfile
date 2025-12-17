# Debian Bullseye (11)
FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/debian:latest
LABEL org.opencontainers.image.title="Debian GNU Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Debian GNU Linux Base Image'

ENV DEBIAN_FRONTEND=noninteractive \
  PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

RUN apt update -y --fix-missing \
    && apt install -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        curl \
        file \
        git \
        zsh \
        procps \
        net-tools \
        procps \
        htop \
        sudo \
        neovim \
        unzip \
        wget \
        xz-utils \
    && apt autoremove -y \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && rm -fr /var/lib/apt/lists/* \

CMD ["/bin/bash"]
