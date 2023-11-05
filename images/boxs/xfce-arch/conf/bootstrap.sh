#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2021-10-18 22:48:51
 # @LastEditTime: 2023-11-05 21:29:35
 # @LastEditors: Cloudflying
 # @Description:
###
mv /tmp/conf/entrypoint.sh /usr/bin/entrypoint && chmod +x /usr/bin/entrypoint

echo "==> Fix local env"
# rm -fr /etc/update-motd.d/*
# mv /tmp/conf/00-motd /etc/update-motd.d/00-header

[ -f '/tmp/conf/supervisord.conf' ] && mv /tmp/conf/supervisord.conf /etc/supervisor.d/supervisord.ini

cp -fr /tmp/conf/zshrc ${HOME_DIR}/.zshrc

#  程序启动文件 快捷方式
mkdir -p ${HOME_DIR}/.local/share/applications/desktop
# 存放icon图标和cursor主题
mkdir -p ${HOME_DIR}/.local/share/icons
mkdir -p ${HOME_DIR}/.fonts
# 存放主题文件 含有 xfwm4 目录
mkdir -p ${HOME_DIR}/.themes
mkdir -p ${HOME_DIR}/.backgrounds
# 自启动程序放置目录 .desktop 文件
mkdir -p ${HOME_DIR}/.config/autostart

echo '==> Config SSH Configure'
# Archlinux 需要手动生成
ssh-keygen -A
sed -i 's/^#ClientAliveInterval.*/ClientAliveInterval 60/g' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i "s/^#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g" /etc/ssh/sshd_config
# 不使用公匙
# sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

touch /var/log/sshd.log

# 更新本地环境
# 本地语言
# echo "LANG=en_US.UTF-8" >> /etc/environment
# echo "LC_ALL=en_US.UTF-8" >> /etc/environment
# echo "LANG=en_US.UTF-8" > /etc/locale.conf
# echo "LC_ALL=en_US.UTF-8" >> /etc/locale.conf

# LANG="en_US.UTF-8"
# LANGUAGE="en_US.UTF-8"
# LC_CTYPE="UTF-8"
# LC_MESSAGES="en_US.UTF-8"
# LC_TIME="en_US.UTF-8"
# LC_ALL="en_US.UTF-8"
# locale-gen en_US.UTF-8 zh_CN.UTF-8

# 删除环境不需要的字体 主题 文档等等
rm -fr /usr/share/themes/Daloa
rm -fr /usr/share/themes/Kokodi
rm -fr /usr/share/themes/Moheli
rm -fr /usr/share/themes/Default-xhdpi
rm -fr /usr/share/themes/Default-hdpi

# neovim
mkdir -p ${HOME_DIR}/.config/nvim
mv /tmp/conf/init.vim ${HOME_DIR}/.config/nvim/init.vim

rm -fr /tmp/*

mkdir -p $VNC_PASSWD_PATH
echo "$VNC_PASSWD" | vncpasswd -f > $VNC_PASSWD_PATH/passwd
chown -R ${USER}:${USER} ${HOME_DIR}
chmod -R 755 ${HOME_DIR}
chmod 600 $VNC_PASSWD_PATH/passwd

# Systemd Autostart
# ls -lha /usr/lib/systemd/system/
# ls -lha /etc/systemd/system/multi-user.target.wants/
# mkdir -p /etc/systemd/system/multi-user.target.wants/
# ln -s /usr/lib/systemd/system/sshd.service /etc/systemd/system/multi-user.target.wants/sshd.service
# ln -s /usr/lib/systemd/system/supervisord.service /etc/systemd/system/multi-user.target.wants/supervisord.service
