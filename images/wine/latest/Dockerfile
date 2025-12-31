FROM ghcr.io/dockenv/archlinux:latest
LABEL org.opencontainers.image.title="Wine" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='WINE Is Not An Emulator - runs MS Windows programs Wine is a program which allows running Microsoft Windows programs (including DOS, Windows 3.x and Win32 executables) on Unix.'

RUN pacman -Syy \
  && pacman -S --noconfirm wine \
    wine-gecko \
    wine-mono \
    winetricks \
    vkd3d \
    lib32-vkd3d \
  && pacman -Scc --noconfirm \
  && rm -fr /var/cache/pacman/pkg/*

CMD ["/bin/bash"]