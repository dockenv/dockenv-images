FROM archlinux/archlinux:latest

LABEL org.opencontainers.image.title="Archlinux" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
  org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
  org.opencontainers.image.url="https://dockenv.github.io" \
  org.opencontainers.image.description='Dart is a client-optimized language for fast apps on any platform.'

ENV PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin" \
    TZ='Asia/Shanghai'

ADD ./pacman.conf /etc/pacman.conf
ADD ./mirrorlist /etc/pacman.d/mirrorlist

RUN ln -sf /proc/self/mounts /etc/mtab \
    && ln --symbolic "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && pacman -Syy \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman -S --noconfirm archlinux-keyring \
    && pacman -Su --noconfirm \
    && pacman -Scc --noconfirm \
    && rm -fr /var/cache/pacman/pkg/* \
    && rm -fr /var/lib/pacman/sync/*.db

CMD ["/bin/bash"]
