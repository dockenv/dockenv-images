FROM ghcr.io/dockenv/debian:bookworm

LABEL org.opencontainers.image.title="CrossOver" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='WINE Is Not An Emulator - runs MS Windows programs Wine is a program which allows running Microsoft Windows programs (including DOS, Windows 3.x and Win32 executables) on Unix.'

ADD https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_25.1.0-1.deb /tmp/crossover.deb

RUN dpkg --add-architecture i386 \
  && apt update \
  && apt install --install-recommends -y sudo \
    perl \
    pulseaudio \
    libpulse-dev \
    python3-gi \
    python3-dbus \
    python3-gi-cairo \
    gir1.2-gtk-3.0 \
    gir1.2-gdkpixbuf-2.0 \
    gir1.2-pango-1.0 \
    gir1.2-glib-2.0 \
    gir1.2-vte-2.91 \
    openssl \
    desktop-file-utils \
  && useradd -G video,sudo,pulse-access -ms /bin/bash dockenv \
  && echo "dockenv:dockpass" | chpasswd \
  && echo 'crossover ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && dpkg -i /tmp/crossover.deb \
  && rm -fr /tmp/crossover.deb \
  && apt autoremove -y \
  && apt-get autoclean -y \
  && rm -fr /var/lib/apt/lists/*

CMD ["/bin/bash"]