#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2021-10-18 22:48:51
 # @LastEditTime: 2021-12-06 21:31:09
 # @LastEditors: Cloudflying
 # @Description:
 # @FilePath: /dockenv/images/boxs/xfce-arch/conf/bootstrap.sh
###
mv /tmp/conf/entrypoint.sh /usr/bin/entrypoint
chmod +x /usr/bin/entrypoint

echo "==> Fix local env"
# rm -fr /etc/update-motd.d/*
# mv /tmp/conf/00-motd /etc/update-motd.d/00-header

# sed -i 's/mirrors.aliyun.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# sed -i 's/mirrors.aliyun.com/mirror.nju.edu.cn/g' /etc/apt/sources.list
# sed -i 's/mirrors.aliyun.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list
# sed -i 's/mirrors.aliyun.com/mirrors.huaweicloud.com/g' /etc/apt/sources.list
# sed -i 's/mirrors.aliyun.com/mirror.lzu.edu.cn/g' /etc/apt/sources.list
# sed -i 's/mirrors.aliyun.com/mirrors.163.com/g' /etc/apt/sources.list

mkdir -p /tmp/.deps
cd /tmp/.deps

# if [[ -z "$(command -v vncserver)" ]]; then
#     wget -qc https://cloudflying-generic.pkg.coding.net/storage/mirrors/pkgs/tigervnc/tigervnc-1.10.0.x86_64.tar.gz
#     tar -xf tigervnc-1.10.0.x86_64.tar.gz
#     cp -fr tigervnc-1.10.0.x86_64/* /
# fi

if [[ ! -d '/opt/novnc' ]]; then
    wget -qc https://cloudflying-generic.pkg.coding.net/storage/mirrors/pkgs/novnc/noVNC-1.2.0.tar.gz
    tar -xf noVNC-1.2.0.tar.gz
    mv noVNC-1.2.0 /opt/novnc
    sed -i "#s#<title>noVNC</title>#<title>Docker Ubuntu Xfce4 Desktop</title>#g" /opt/novnc/vnc.html
fi

cd && rm -fr /tmp/.deps

if [[ ! -f "${HOME_DIR}/.zshrc" ]]; then
    useradd -d /home/${USER} -m -s "$(command -v zsh)" ${USER}
    echo "${USER}:${PASSWD}" | chpasswd
    echo "root:${PASSWD}" | chpasswd
    echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
    # git clone --depth 1 https://e.coding.net/pkgs/oh-my-zsh/oh-my-zsh.git ${HOME_DIR}/.oh-my-zsh
    cp -fr /tmp/oh-my-zsh ${HOME_DIR}/.oh-my-zsh
    # cp ${HOME_DIR}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME_DIR}/.zshrc
    mv /tmp/conf/zshrc ${HOME_DIR}/.zshrc
    sed -i 's/ZSH_THEME.*/ZSH_THEME="strug"/g' ${HOME_DIR}/.zshrc
fi

[ ! -d '/run/sshd' ] && mkdir -p /run/sshd
[ ! -d '/etc/supervisor.d' ] && mkdir -p /etc/supervisor.d
[ -f '/tmp/conf/supervisord.conf' ] && mv /tmp/conf/supervisord.conf /etc/supervisor.d/supervisord.ini

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

if [[ -z "${SSH_PORT}" ]]; then
    SSH_PORT=22
fi

echo '==> Config SSH Configure'
# Archlinux 需要手动生成
ssh-keygen -A
sed -i 's/^#ClientAliveInterval.*/ClientAliveInterval 60/g' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i "s/^#Port.*/Port ${SSH_PORT}/g" /etc/ssh/sshd_config
sed -i "s/^#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g" /etc/ssh/sshd_config
# 不使用公匙
# sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config


mkdir -p /var/log/
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

# 本地时区设定
echo 'Asia/Shanghai' > /etc/timezone
rm -fr /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

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

mkdir -p ${HOME_DIR}/.pip && touch ${HOME_DIR}/.pip/pip.conf

echo "[global]
index-url = https://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host=mirrors.aliyun.com" > ${HOME_DIR}/.pip/pip.conf

mkdir -p $VNC_PASSWD_PATH
echo "$VNC_PASSWD" | vncpasswd -f > $VNC_PASSWD_PATH/passwd
chown -R ${USER}:${USER} ${HOME_DIR}
chmod -R 755 ${HOME_DIR}
chmod 600 $VNC_PASSWD_PATH/passwd
# Systemd Autostart
# ls -lha /usr/lib/systemd/system/
# ls -lha /etc/systemd/system/multi-user.target.wants/
mkdir -p /etc/systemd/system/multi-user.target.wants/
ln -s /usr/lib/systemd/system/sshd.service /etc/systemd/system/multi-user.target.wants/sshd.service
ln -s /usr/lib/systemd/system/supervisord.service /etc/systemd/system/multi-user.target.wants/supervisord.service
