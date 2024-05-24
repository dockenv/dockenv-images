#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-09-23 16:40:52
 # @LastEditTime: 2024-05-24 11:31:43
 # @LastEditors: Cloudflying
 # @Description: Init Seedbox
###

PKG_HOME="/opt"
USER_HOME="/home/dockenv"

_init()
{
    adduser -s /bin/sh -D dockenv
    # 预设密码
    echo "dockenv:dockenv" | chpasswd
    echo "dockenv ALL=(ALL:ALL) ALL" >> /etc/sudoers

    mkdir -p /data/downloads /etc/aria2c /opt/ariang /etc/supervisor.d
    mkdir -p /home/dockenv/.config/autobrr
    chmod -R 755 /etc/aria2c /opt/ariang /data/downloads
    chown -R dockenv:dockenv /etc/aria2c /opt/ariang /data/downloads
    mv /etc/aria2c/entrypoint.sh /usr/bin/entrypoint.sh
    chmod +x /usr/bin/entrypoint.sh
}

pkg_add()
{
    apk add --no-cache $@
}

add_base()
{
    pkg_add --virtual .deps curl-dev gcc make g
    pkg_add ffmpeg ttyd
    pkg_add unzip sudo curl wget coreutils
    # Web Server
    pkg_add caddy
    pkg_add python3 py3-pip supervisor
    pkg_add minidlna
}

add_filebrowser()
{
    FILE_BROWSER_VER="2.25.0"
    mkdir -p ${PKG_HOME}/filebrowser /etc/filebrowser
    cp /conf/filebrowser /etc/filebrowser/
    chmod -R 777 /etc/filebrowser
    cd ${PKG_HOME}/filebrowser || exit
    wget -c "https://github.com/filebrowser/filebrowser/releases/download/v${FILE_BROWSER_VER}/linux-amd64-filebrowser.tar.gz"
    tar -xvf linux-amd64-filebrowser.tar.gz
    rm -fr linux-amd64-filebrowser.tar.gz CHANGELOG.md README.md LICENSE
    chmod +x /opt/filebrowser/filebrowser
}

add_ariang()
{
    ARIANG_VER="1.3.6"
    mkdir -p ${PKG_HOME}/ariang
    cd ${PKG_HOME}/ariang || exit
    wget https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VER}/AriaNg-${ARIANG_VER}-AllInOne.zip
    unzip AriaNg-${ARIANG_VER}-AllInOne.zip
    rm -fr LICENSE AriaNg-${ARIANG_VER}-AllInOne.zip
}

add_aria_webui()
{
    mkdir -p ${PKG_HOME}/aria_webui
    cd ${PKG_HOME}/aria_webui || exit
    wget https://github.com/ziahamza/webui-aria2/archive/refs/heads/master.zip
    unzip master.zip
    mv webui-aria2-master/docs/* .
    rm -fr master.zip webui-aria2-master
}

# ☁️ Cloud Torrent: a self-hosted remote torrent client
# https://github.com/jpillora/cloud-torrent
add_cloud_torrent()
{
    PKG_VER="0.8.25"
    mkdir -p ${PKG_HOME}/cloud_torrent
    cd ${PKG_HOME}/cloud_torrent || exit
    wget https://github.com/jpillora/cloud-torrent/releases/download/${PKG_VER}/cloud-torrent_linux_amd64.gz
    gzip -d cloud-torrent_linux_amd64.gz
    mv cloud-torrent_linux_amd64 cloud-torrent
    rm -fr master.zip webui-aria2-master
    chmod +x /opt/cloud_torrent/cloud-torrent
    # Add Config File
    mkdir -p ${USER_HOME}/.config/cloud-torrent
    cp -fr /conf/cloud-torrent.json ${USER_HOME}/.config/cloud-torrent/
}

# The python3 version of the automated Comic Book downloader (cbr/cbz) for use with various download clients.
# https://github.com/mylar3/mylar3
add_mylar()
{
    mkdir -p /opt/mylar /data/downloads/mylar
    chmod -R 755 /data/downloads
    chown -R dockenv:dockenv /data/downloads
    cd /opt/mylar || exit
    wget https://github.com/mylar3/mylar3/archive/refs/heads/master.zip
    unzip master.zip
    mv mylar3-master/* .
    rm -fr master.zip mylar3-master
    pip install -r requirements.txt
}

# 🎧☁️ Modern Music Server and Streamer compatible with Subsonic/Airsonic
# https://github.com/navidrome/navidrome
add_navidrome()
{
    NAVIDROME_VER="0.49.3"
    mkdir -p /opt/navidrome
    cd /opt/navidrome || exit
    wget https://github.com/navidrome/navidrome/releases/download/v${NAVIDROME_VER}/navidrome_${NAVIDROME_VER}_Linux_x86_64.tar.gz
    tar -xvf navidrome_${NAVIDROME_VER}_Linux_x86_64.tar.gz
    rm -fr LICENSE README.md navidrome_${NAVIDROME_VER}_Linux_x86_64.tar.gz
    chmod +x /opt/navidrome/navidrome
    cp -fr /conf/navidrome /home/dockenv/.config/
}

# Modern, easy to use download automation for torrents and usenet.
# https://github.com/autobrr/autobrr
add_autobrr()
{
    PKG_VER="1.30.0"
    PKG_NAME="autobrr"
    mkdir -p /opt/${PKG_NAME}
    cd /opt/${PKG_NAME} || exit
    wget https://github.com/autobrr/autobrr/releases/download/v${PKG_VER}/autobrr_${PKG_VER}_linux_x86_64.tar.gz
    tar -xvf autobrr_${PKG_VER}_linux_x86_64.tar.gz
    rm -fr LICENSE README.md autobrr_${PKG_VER}_linux_x86_64.tar.gz
}

# SABnzbd - The automated Usenet download tool
# https://github.com/sabnzbd/sabnzbd
add_sabnzbd()
{
    mkdir -p /opt/sabnzbd
    cd /opt/sabnzbd || exit
    wget https://github.com/sabnzbd/sabnzbd/archive/refs/heads/develop.zip
    unzip develop.zip
    mv sabnzbd-develop/* .
    rm -fr develop.zip sabnzbd-develop
    pip install -r requirements.txt
}

add_downloader()
{
    pkg_add aria2 qbittorrent-nox transmission-cli deluge
    pkg_add axel lftp
    # 有点大
    # pkg_add flexget
    # BGmi 是一个用来追番的命令行程序.
    pip install --upgrade youtube-dl youtube-dlc yt-dlp bgmi you-get
}

add_file_sync()
{
    pkg_add rsync vsftpd syncthing
}

reload_tracker(){
	#下载最新的bt-tracker
	wget -O /tmp/trackers_best.txt https://api.xiaoz.org/trackerslist/
	tracker=$(cat /tmp/trackers_best.txt)
	#替换处理bt-tracker
	tracker="bt-tracker="${tracker}
	#更新aria2配置
	sed -i '/bt-tracker.*/'d /etc/aria2c/aria2c.conf
	echo ${tracker} >> /etc/aria2c/aria2c.conf
	echo '-------------------------------------'
	echo 'bt-tracker update completed.'
	echo '-------------------------------------'
}

_init
add_base
add_filebrowser
add_ariang
add_aria_webui
add_cloud_torrent
# 不好用
# add_mylar
add_navidrome
add_autobrr
# add_sabnzbd
add_downloader
add_file_sync

apk del .deps
