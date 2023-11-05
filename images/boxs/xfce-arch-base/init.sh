#!/usr/bin/env bash

USER='dockenv'
PASSWD='dockenv'

COUNTRY="US"
COUNTRY="CN"

# if [[ ! -n "$(command -v curl)" ]];then
	# COUNTRY=$(curl -sL ifconfig.co/country-iso)
# fi

if [[ "${COUNTRY}" == 'CN' ]];then
	echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
	echo "Server = https://mirrors.huaweicloud.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
	echo "Server = https://mirrors.cloud.tencent.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
fi

pacman -Syyu --noconfirm
pacman-key --init
pacman-key --populate archlinux

pacman -S --noconfirm \
	xfce4 \
    xfce4-artwork \
	xfce4-cpufreq-plugin \
	xfce4-cpugraph-plugin \
	xfce4-datetime-plugin \
	xfce4-dict \
	xfce4-diskperf-plugin \
    xfce4-eyes-plugin \
	xfce4-mount-plugin \
	xfce4-mpc-plugin \
	xfce4-pulseaudio-plugin \
	xfce4-screenshooter \
    xfce4-systemload-plugin \
	xfce4-taskmanager \
	xfce4-time-out-plugin \
	xfce4-timer-plugin \
	xfce4-whiskermenu-plugin

# inetutils Provide hostname ftp telnet command etc ...
# xorg-xrandr 设置分辨率
pacman -S --noconfirm dbus exo garcon tumbler ristretto parole inetutils xorg-xrandr xorg-server

# File Manage
pacman -S --noconfirm thunar thunar-archive-plugin thunar-volman

pacman -S --noconfirm tigervnc python python-pip python-pynvim openssh dialog
pacman -S --noconfirm python-numpy python-wheel

# if [[ "${COUNTRY}" == 'CN' ]];then
# 	pip install websockify --break-system-packages -i http://mirrors.cloud.aliyuncs.com/pypi/simple/
# 	# pip install wheel numpy websockify --break-system-packages -i https://repo.huaweicloud.com/pypi/simple/
# 	# pip install wheel numpy websockify --break-system-packages -i http://mirrors.cloud.aliyuncs.com/pypi/simple/
# else
# 	pip install websockify --break-system-packages
# fi

# build desktop require
pacman -S --noconfirm supervisor sudo wget curl git neovim tree less zsh bat net-tools
    # && pacman -S --noconfirm expect httpie axel jq screen iftop enca
    # Archive Compress
    # && pacman -S --noconfirm unarchiver zip unzip bzip2 unrar zstd gzip p7zip xz
    # && pacman -S --noconfirm procps gnu-netcat htop rsync iproute2 whois
    # && pacman -S --noconfirm ncdu catfish bleachbit meld synapse fzf remmina strace
    # && pacman -S --noconfirm sshfs proxychains-ng
    # Mail Client
    # && pacman -S --noconfirm thunderbird
    # Downloader qbittorrent-nox ktorrent rtorrent deluge transmission-cli or transmission-gtk or -qt
    # && pacman -S --noconfirm aria2
    # && pacman -S --noconfirm qbittorrent
    # Documents && Office
    # 进入系统后自定义安装
    # Calibre 图书创作工具
    # && pacman -S --noconfirm okular calibre fbreader libreoffice-still libreoffice-still-zh-cn
    # && pacman -S --noconfirm midori
    # productivity and creative suite && Image Manipulation
    # && pacman -S --noconfirm calligra gimp gimp-help-zh_cn
    # && pacman -S --noconfirm krita krita-plugin-gmic
    # screencast and screenshot
    # kazam 将输入的字符转为 ASCII logo
    # recordmydesktop 命令行版本录屏
    # simplescreenrecorder 录屏
    # && pacman -S --noconfirm shutter asciinema recordmydesktop simplescreenrecorder
    # FTP Client
    # && pacman -S --noconfirm filezilla
    # && pacman -S --noconfirm firefox firefox-developer-edition firefox-i18n-zh-cn firefox-developer-edition-i18n-zh-cn
    # Security
    # && pacman -S --noconfirm clamav clamtk ufw gufw
    # fonts
    # noto-fonts-cjk 文件过大 292 MB
    # noto-fonts 114M
    # && pacman -S --noconfirm ttf-ubuntu-font-family noto-fonts-emoji wqy-microhei wqy-zenhei wqy-microhei ttf-fira-code ttf-fira-mono ttf-jetbrains-mono woff-fira-code ttf-liberation powerline-fonts

pacman -S --noconfirm pavucontrol pulseaudio pulseaudio-alsa

pacman -Rsc xfce4-power-manager

# 初始化用户
useradd -d /home/${USER} -m -s /usr/bin/zsh ${USER}
echo "${USER}:${PASSWD}" | chpasswd
echo "root:${PASSWD}" | chpasswd
echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

# && git clone --depth 1 https://e.coding.net/pkgs/oh-my-zsh/oh-my-zsh.git /home/${USER}/oh-my-zsh
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /home/${USER}/.oh-my-zsh
# cp ${HOME_DIR}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME_DIR}/.zshrc
# sed -i 's/ZSH_THEME.*/ZSH_THEME="strug"/g' ${HOME_DIR}/.zshrc

# 初始化 VNC
git clone --depth 1 https://github.com/novnc/noVNC.git /opt/novnc
git clone --depth 1 https://github.com/novnc/websockify.git /opt/novnc/utils/websockify

sed -i "#s#<title>noVNC</title>#<title>Xfce4 Desktop Run on Docker</title>#g" /opt/novnc/vnc.html

[ ! -d '/run/sshd' ] && mkdir -p /run/sshd
[ ! -d '/etc/supervisor.d' ] && mkdir -p /etc/supervisor.d

mkdir -p /var/log

# 本地时区设定
echo 'Asia/Shanghai' > /etc/timezone
rm -fr /etc/localtime && ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

rm -fr /var/cache/pacman/pkg/*
rm -fr /var/lib/pacman/sync/*