FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/debian:latest

LABEL org.opencontainers.image.title="Debian Base Desktop Env" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Debian Base Desktop Env.'

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y xfce4 \
      xfce4-appmenu-plugin \
      xfce4-terminal \
      xfce4-whiskermenu-plugin \
      xfce4-datetime-plugin \
      xfce4-indicator-plugin \
      xfce4-goodies \
      xfce4-panel-profiles \
      xfce4-screenshooter \
      xfce4-systemload-plugin \
      xfce4-taskmanager \
    && apt install -y \
      systemd \
      init \
      lsb-release \
      apt-transport-https \
      apt-utils \
    && apt install -y --no-install-recommends locales supervisor sudo openssh-server \
    && apt install -y --no-install-recommends \
      iso-codes \
      openssl \
      gnupg \
      lsof \
      universal-ctags \
      strace \
      psmisc \
      file \
      psutils \
      dnsutils \
      expect \
    && apt install -y --no-install-recommends \
      bat \
      zsh \
      git \
      wget \
      curl \
      httpie \
      neovim \
      jq \
      tree \
      screen \
      less \
      iftop \
      enca \
    # Archive Compress
    && apt install -y --no-install-recommends \
      arj \
      7zip \
      brotli \
      bzip2 \
      lunzip \
      lzip \
      rpm \
      rar \
      unalz \
      unar \
      unrar \
      unzip \
      unrar-free \
      zip \
      zstd \
      gzip \
      p7zip \
      p7zip-full \
      p7zip-rar \
    # cabextract xz-utils \
    && apt install -y --no-install-recommends \
      net-tools \
      procps \
      btop htop \
      netcat-openbsd \
      rsync \
      iproute2 \
      whois \
    # Python Plguins
    && apt install -y --no-install-recommends \
      python3 python3-pip \
      python3-apt \
      python3-pynvim \
    && apt install -y --no-install-recommends xinit xauth pkg-config yelp yelp-xsl zenity \
    # dialog Displays user-friendly dialog boxes from shell scripts
    && apt install -y --no-install-recommends \
      pavucontrol \
      apulse \
      dialog \
      xvfb \
      alsamixergui \
      alsa-utils \
      alsa-tools \
      alsa-tools-gui \
    && apt install -y --no-install-recommends \
      libgl1-mesa-dri \
      libnss-wrapper \
      mesa-utils \
      xserver-xorg-video-fbdev \
      xserver-xorg-video-vesa \
      xserver-xorg-input-evdev \
    && apt install -y \
      tigervnc-standalone-server tigervnc-tools \
      xrdp \
      xorgxrdp \
      x11vnc x11-xserver-utils \
      dbus dbus-x11  \
      xdg-utils \
      openbox \
    # && apt install -y --no-install-recommends fonts-ubuntu fonts-noto-mono ttf-ubuntu-font-family ttf-wqy-zenhei xfonts-base xfonts-100dpi \
    # xfonts-75dpi xfonts-scalable xfonts-cyrillic ttf-wqy-zenhei fonts-wqy-zenhei fonts-wqy-microhei xfonts-wqy fonts-mononoki \
    # fonts-noto-mono fonts-liberation \
    && apt install -y websockify \
    # editor 考虑 sublime text 为替代品
    && apt install -y --no-install-recommends gedit \
    && apt install -y --no-install-recommends gvfs gvfs-backends gvfs-fuse \
    && apt install -y --no-install-recommends fuse3 fuse-overlayfs fuse2fs fusefat fuseiso \
    # 美化
    # mcdu ncurses disk usage viewer
    # catfish 文件搜索神器
    # bleachbit 清理系统垃圾文件
    # meld 视觉差异和合并工具。MELD帮助您比较文件、目录和版本控制的项目
    # synapse 启动器 类似 alfred 的简陋版本
    # fzf 命令行文件快速搜索
    # thunderbird Mail Client
    # && apt install -y --no-install-recommends menulibre ncdu catfish bleachbit meld synapse fzf thunderbird \
    # Remote Desktop
    && apt install --no-install-recommends -y remmina \
      remmina-plugin-exec \
      remmina-plugin-rdp \
      remmina-plugin-vnc \
      remmina-plugin-secret \
      remmina-plugin-kwallet \
      remmina-plugin-spice \
      remmina-plugin-www \
    # multimedia Pic Viewer
    # inkscape vector-based drawing program
    # apt install -y --no-install-recommends nomacs smplayer inkscape \
    # Twin panel file management for your desktop
    # kdiff3 kcompare
    # && apt install -y --no-install-recommends krusader krename  \
    # && apt install -y --no-install-recommends language-pack-zh-hans \
    # Other Packages
    # && apt install -y --no-install-recommends sshfs proxychains4 tcpdump \
    # Downloader
    && apt install -y --no-install-recommends \
      aria2 \
      axel \
      rtorrent \
      qbittorrent \
      deluge deluged deluge-console deluge-web \
    && apt install -y --no-install-recommends tmux ffmpeg \
    && apt install -y --no-install-recommends \
      firefox-esr firefox-esr-l10n-zh-cn \
      chromium chromium-l10n \
    # Security
    # clamtk GUI 不好用
    # clamav
    # gufw ufw GUI
    && apt install --no-install-recommends -y ufw gufw \
    # Okular universal document viewer 文档阅读软件，支持 PDF、TIFF、CHM、ODF、EPUB、mobi 等文档格式 524MB
    && apt install --no-install-recommends -y okular \
    # Office
    # libreoffice
    # && apt install --no-install-recommends -y libreoffice libreoffice-help-zh-cn libreoffice-l10n-zh-cn \
    # File Manager
    && apt install --no-install-recommends -y \
      thunar thunar-archive-plugin thunar-gtkhash thunar-volman \
    # Editor && IDE
    # && apt install -y --no-install-recommends mousepad geany
    # Install sound dev 暂时用不到
    && apt install -y --no-install-recommends \
      libasound2-dev \
    && apt install -y --fix-missing \
    && apt autoremove -y \
    && apt-get autoclean -y \
    && rm -fr /var/lib/apt/lists/*