FROM archlinux/archlinux:latest

LABEL MAINTAINER="Cloudflying" \
    MAIL="oss@live.hk" \
    org.opencontainers.image.source=https://github.com/dockenv/dockenv \
    org.opencontainers.image.description='Archlinux'

ENV PATH="/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin" \
    TZ='Asia/Shanghai'

ADD ./pacman.conf /etc/pacman.conf

RUN ln -sf /proc/self/mounts /etc/mtab \
    && echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist \
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

CMD /bin/bash
