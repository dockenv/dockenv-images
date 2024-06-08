FROM ghcr.io/dockenv/debian:bookworm
LABEL org.opencontainers.image.title="Wine" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='WINE Is Not An Emulator - runs MS Windows programs Wine is a program which allows running Microsoft Windows programs (including DOS, Windows 3.x and Win32 executables) on Unix.'

RUN dpkg --add-architecture i386 \
  && apt update \
  && apt install -y wget curl \
  && mkdir -pm755 /etc/apt/keyrings \
  && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
  && wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources \
  && apt update \
  && apt install --install-recommends -y winehq-staging \
  && apt autoremove -y \
  && apt-get autoclean -y \
  && rm -fr /var/lib/apt/lists/*