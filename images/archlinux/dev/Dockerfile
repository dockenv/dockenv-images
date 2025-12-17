FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/archlinux:latest

LABEL org.opencontainers.image.title="Archlinux" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.url="https://dockenv.github.io" \
  org.opencontainers.image.description='Dart is a client-optimized language for fast apps on any platform.'

RUN pacman -Syy \
    && pacman -S --noconfirm base-devel neovim git \
    && pacman -Scc --noconfirm \
    && rm -fr /var/cache/pacman/pkg/*

CMD ["/bin/bash"]
