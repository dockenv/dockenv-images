#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-07-01 12:36:33
# @LastEditTime: 2024-04-18 16:59:31
# @LastEditors: Cloudflying
# @Description: Init Docker Images
###


. /etc/os-release

# 本地时区设定
echo 'Asia/Shanghai' > /etc/timezone
rm -fr /etc/localtime ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

apt update -y
apt upgrade -y

apt install -y ca-certificates

[ -f '/tmp/conf/entrypoint.sh' ] && cp /tmp/conf/entrypoint.sh /usr/bin/entrypoint && chmod +x /usr/bin/entrypoint
[ -f '/tmp/conf/dockenv-deb-init.sh' ] && cp /tmp/conf/dockenv-deb-init.sh /usr/bin/dockenv-init && chmod +x /usr/bin/dockenv-init

# 添加非自由软件
sed -i 's#Components:.*#Components: main non-free contrib non-free-firmware#g' /etc/apt/sources.list.d/debian.sources
# 修改软件源
# sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list.d/debian.sources

# short package install command
pkg_add() {
    apt-get install -y --no-install-recommends --no-install-suggests $@
}

# 下载二进制文件 并赋予执行权限
# @param $1 Save Name Or Platform
# @param $2 Platform is exist
# Common Executable Binary,example shell php python
# ~/.bin/all
# Linux
# ~/.bin/lin
# macOS
# ~/.bin/mac
add_bin() {
    BIN_DIR=${HOME}/.bin
    if [[ "${1}" != 'lin' ]]; then
        SAVE_PATH="${BIN_DIR}/lin/$2"
    elif [[ "${1}" != 'mac' ]]; then
        SAVE_PATH=="${BIN_DIR}/mac/$2"
    else
        SAVE_PATH="${BIN_DIR}/$2"
    fi
    # wget -c $1 -O $SAVE_PATH
    wget -c $1 -O $BIN_DIR/$2
    chmod +x ${SAVE_PATH}
}

apt update -y
apt upgrade -y

# Editor
apt install -y neovim vim

# Database
apt install -y redis-server memcached

# MultiMedia
apt install -y ffmpeg

# Downloader
apt install -y wget curl httpie axel

# Compress
apt install -y 7zip brotli bzip2 lunzip lzip rpm rar unalz unar unrar unzip unrar-free zip zstd gzip \
        p7zip p7zip-full p7zip-rar

# Install Packages
pkg_add ca-certificates locales openssh-server sudo
pkg_add jq procps htop less file wget curl iputils-ping net-tools
pkg_add zsh bat eza
pkg_add openssl
pkg_add gnupg

# Network Tools
pkg_add lsof net-tools htop netcat-openbsd rsync iproute2 whois tcpdump
pkg_add universal-ctags strace psmisc psutils dnsutils expect
pkg_add supervisor
pkg_add lsb-release
pkg_add apt-transport-https apt-utils software-properties-common
# pkg_add python3
# pkg_add iso-codes
# pkg_add python3-pip python3-neovim
# pkg_add python3-apt
pkg_add fzf silversearcher-ag ripgrep

# Utils Tools
apt install -y fzf bat zsh git jq tree screen less iftop enca

# Some Toy
apt install -y fortunes fortunes-zh cowsay

# Editor
pkg_add neovim

# Git
pkg_add git gh git-delta

# wget -q https://mirrors.xie.ke/pkgs/Linux/exa-linux-x86_64-v0.10.1/bin/exa -O /usr/bin/exa
# chmod +x /usr/bin/exa

# Compress
pkg_add 7zip brotli bzip2 gzip lunzip lzip unar unrar unzip p7zip p7zip-full p7zip-rar rar unrar-free zip zstd

# Compile and Vim is require
# apt install build-essential automake autoconf make cmake

# for neovim
# pip install -U setuptools
# pip install pynvim websockets pip_search "python-lsp-server[all]"

# wget -q "https://packages.microsoft.com/config/ubuntu/${VERSION_ID}/packages-microsoft-prod.deb" -O /tmp/mspkg.deb \
# dpkg -i /tmp/mspkg.deb \
# apt update -y \
# apt install -y dotnet-runtime-${DOTNET_VER} dotnet-sdk-${DOTNET_VER}

php_env() {
    # PHP And Composer
    pkg_add php8.2-amqp php8.2-apcu php8.2-ast php8.2-bcmath php8.2-bz2 \
        php8.2-curl php8.2-dba php8.2-dev php8.2-ds php8.2-enchant php8.2-fpm php8.2-gd \
        php8.2-gearman php8.2-gmp php8.2-gnupg php8.2-http \
        php8.2-igbinary php8.2-imagick php8.2-imap php8.2-interbase \
        php8.2-intl php8.2-ldap php8.2-mailparse php8.2-maxminddb php8.2-mbstring \
        php8.2-mcrypt php8.2-memcache php8.2-memcached php8.2-mongodb php8.2-msgpack \
        php8.2-mysql php8.2-oauth php8.2-odbc php8.2-opcache php8.2-pcov php8.2-pgsql \
        php8.2-phpdbg php8.2-ps php8.2-pspell php8.2-psr php8.2-raphf \
        php8.2-readline php8.2-redis php8.2-rrd php8.2-smbclient php8.2-snmp php8.2-soap \
        php8.2-sqlite3 php8.2-ssh2 php8.2-stomp php8.2-sybase php8.2-tidy php8.2-uopz \
        php8.2-uploadprogress php8.2-uuid php8.2-xdebug php8.2-xml php8.2-xmlrpc php8.2-xsl \
        php8.2-yaml php8.2-zip php8.2-zmq

    wget -qc https://getcomposer.org/download/latest-stable/composer.phar -O /usr/bin/composer
    chmod +x /usr/bin/composer

    PHP_VER=8.2
    sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/display_errors = .*/display_errors = On/" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/date.timezone.*/date.timezone = 'Asia\/Shanghai'/" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 512M/" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/post_max_size = .*/post_max_size = 512M/" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/max_file_uploads =.*/max_file_uploads = 256/g" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/display_startup_errors =.*/display_startup_errors = On/g" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/log_errors =.*/log_errors = On/g" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/default_charset =.*/default_charset = "UTF-8"/g" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/max_execution_time =.*/max_execution_time = 300/g" /etc/php/${PHP_VER}/*/php.ini
    sed -i "s#^pm.max_children.*#pm.max_children = 32#" /etc/php/${PHP_VER}/fpm/php-fpm.conf
}

composer_app() {
    # sudo -u ${RUN_USER} mkdir -p ${HOME_DIR}/.config/composer
    # sudo -u ${RUN_USER} composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
    # sudo -u ${RUN_USER} composer global --no-plugins --no-scripts require phpstan/phpstan
    # sudo -u ${RUN_USER} composer global --no-plugins --no-scripts require vimeo/psalm
    # sudo -u ${RUN_USER} composer global --no-plugins --no-scripts require phpunit/phpunit
    # sudo -u ${RUN_USER} composer global --no-plugins --no-scripts require phan/phan

    # Fetch Binary
    add_bin https://github.com/phpstan/phpstan/releases/download/1.8.0/phpstan.phar phpstan
    add_bin https://phpmd.org/static/latest/phpmd.phar phpmd
    add_bin https://phar.phpunit.de/phpcpd.phar phpcpd
    add_bin https://phar.io/releases/phive.phar phive
    add_bin https://github.com/phpro/grumphp/releases/download/v1.13.0/grumphp.phar grumphp
    add_bin https://github.com/deployphp/deployer/releases/download/v7.0.0-rc.8/deployer.phar deployer
    add_bin https://phar.phpunit.de/phpunit.phar phpunit
    add_bin https://phar.phpbu.de/phpbu.phar phpbu
    add_bin https://github.com/vimeo/psalm/releases/download/4.24.0/psalm.phar psalm
    add_bin https://www.phing.info/get/phing-latest.phar phing
    add_bin https://github.com/theseer/phpdox/releases/download/0.12.0/phpdox-0.12.0.phar phpdox
    add_bin https://github.com/phan/phan/releases/download/5.3.2/phan.phar phan
    add_bin https://phpdoc.org/phpDocumentor.phar phpDocumentor
    add_bin https://doctum.long-term.support/releases/dev/doctum.phar doctum
    add_bin https://github.com/mihaeu/dephpend/releases/download/0.8.0/dephpend-0.8.0.phar dephpend
    add_bin https://cs.symfony.com/download/php-cs-fixer-v3.phar hp-cs-fixer
    add_bin https://phar.phpunit.de/phploc.phar phploc
    add_bin https://github.com/infection/infection/releases/download/0.26.13/infection.phar infection
    add_bin https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.7.1/phpcbf.phar phpcbf
    add_bin https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.7.1/phpcs.phar phpcs
    add_bin https://github.com/qossmic/deptrac/releases/download/0.23.0/deptrac.phar deptrac
    add_bin https://www.laravel-enlightn.com/security-checker.phar security-checker
}

# 添加 VSCode 扩展到 Code Server
# 如 微软开发的 Remote 系列则只允许在 VSC 运行
# usage: vsc_ext_add id
vsc_ext_add()
{
    EXT_DIR=${HOME}/.code-server/exts
    mkdir -p /tmp/vsc-ext
    EXT_ID=$(echo "$1" | tr '[A-Z]' '[a-z]')
    EXT_URL="https://marketplace.visualstudio.com/items?itemName=${EXT_ID}"
    EXT_FILE_URL=$(curl -sL ${EXT_URL} | grep -Eo 'https://\S+gallerycdn.vsassets.io/extensions\S+Default' | head -n 1 | sed 's#Icons.Default#VSIXPackage#g')
    EXT_AUTHOR=$(echo "$EXT_FILE_URL" | awk -F 'extensions/' '{print $2}' | awk -F '/' '{print $1}')
    EXT_NAME=$(echo "$EXT_FILE_URL" | awk -F 'extensions/' '{print $2}' | awk -F '/' '{print $2}')
    EXT_VER=$(echo "$EXT_FILE_URL" | awk -F 'extensions/' '{print $2}' | awk -F '/' '{print $3}')
    FULL_NAME="${EXT_AUTHOR}.${EXT_NAME}-${EXT_VER}"
    wget -c ${EXT_FILE_URL} -O /tmp/vsc-ext/${FULL_NAME}.vsix
    unzip -qo /tmp/vsc-ext/${FULL_NAME}.vsix -d /tmp/vsc-ext/
    mv /tmp/vsc-ext/extension ${EXT_DIR}/${FULL_NAME}
}

# Config code-server
vscode_init() {
    # HOME_DIR=${HOME}
    if [[ -z "$(command -v code-server)" ]]; then
        CODE_SERVER_LATEST_VER=$(curl -sI https://github.com/coder/code-server/releases/latest | grep '/releases/tag' | grep -Eo '/v\S+.[0-9]' | sed 's#/v##g')
        # sudo systemctl enable --now code-server@$USER
        CODE_SERVER_URL="https://github.com/coder/code-server/releases/download/v${CODE_SERVER_LATEST_VER}/code-server_${CODE_SERVER_LATEST_VER}_amd64.deb"
        wget -qc ${CODE_SERVER_URL} -O /tmp/code-server_${CODE_SERVER_LATEST_VER}_amd64.deb
        dpkg -i /tmp/code-server_${CODE_SERVER_LATEST_VER}_amd64.deb

        # VSCode Server
        # Not Working
        # VSC_COMMIT_ID="e170252f762678dec6ca2cc69aba1570769a5d39"
        # https://update.code.visualstudio.com/commit:e170252f762678dec6ca2cc69aba1570769a5d39/server-linux-x64/stable
        # wget -q https://vscode.download.prss.microsoft.com/dbazure/download/stable/e170252f762678dec6ca2cc69aba1570769a5d39/vscode-server-linux-x64.tar.gz -O /tmp/vsc.tar.gz

        # mkdir -p ${HOME_DIR}/.vscode-server/bin
        # tar -xf /tmp/vsc.tar.gz -C ${HOME_DIR}/.vscode-server/bin/
        # mv ${HOME_DIR}/.vscode-server/bin/vscode-server-linux-x64 ${HOME_DIR}/.vscode-server/bin/${VSC_COMMIT_ID}

        mkdir -p ${HOME_DIR}/.code-server/exts
        mkdir -p ${HOME_DIR}/.code-server/User
        mkdir -p ${HOME_DIR}/.config/code-server
        cp -fr /tmp/conf/vscode-settings.json ${HOME_DIR}/.code-server/User/settings.json
        cp -fr /tmp/conf/code-server.config.yaml ${HOME_DIR}/.config/code-server/config.yaml

        mkdir -p ${HOME_DIR}/.config/TabNine
        cp -fr /tmp/conf/tabnine_config.json ${HOME_DIR}/.config/TabNine/tabnine_config.json

        # Add Code Server Extensions
        # 有些插件仅支持运行在 VSCode 如 remote ssh
        # defined to run only in code-server for the Desktop
        # Utils
        # ext_add vscode-icons-team.vscode-icons
        # ext_add ms-vscode.sublime-keybindings
        # ext_add editorconfig.editorconfig
        # ext_add eamodio.gitlens
        # ext_add esbenp.prettier-vscode
        # ext_add cweijan.vscode-ssh
        # ext_add dbaeumer.vscode-eslint
        # ext_add rangav.vscode-thunder-client

        # Autocomplete
        # ext_add tabnine.tabnine-vscode
        # ext_add codiga.vscode-plugin

        # Database
        # ext_add cweijan.vscode-mysql-client2

        # PHP
        # ext_add zobo.php-intellisense
        # ext_add bmewburn.vscode-intelephense-client
        # ext_add neilbrayfield.php-docblocker
        # A static analysis tool for finding errors in PHP applications
        # ext_add getpsalm.psalm-vscode-plugin

        # Language support
        # ext_add xadillax.viml
        # ext_add octref.vetur # Vue
        # ext_add redhat.vscode-yaml
        # 不兼容 Code Server
        # ext_add ms-ceintl.vscode-language-pack-zh-hans

        # SanderRonde.phpstan-vscode
        # swordev.phpstan
    fi
}

# install extension for code-server
vsc_ext_add()
{
    code-server --extensions-dir /home/boxs/.code-server/exts --install-extension $@
}

dev_depends_env() {
    apt install -y redis redis-redisearch memcached
}

# Node.js
node_env() {
    pkg_add nodejs npm
}

lang_env() {
    pkg_add golang
}

php_env
# composer_app
# node_env
# dev_depends_env
vscode_init

# Config Language And timezone
sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen
sed -i "s/# zh_CN.UTF-8/zh_CN.UTF-8/" /etc/locale.gen
# locale-gen
echo 'Asia/Shanghai' >/etc/timezone
rm -fr /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Config User
useradd -d /home/${RUN_USER} -m -s /bin/zsh ${RUN_USER}
echo "${RUN_USER}:${USER_PASSWD}" | chpasswd
echo "root:${USER_PASSWD}" | chpasswd
# Config sudo SuperPower
echo "${RUN_USER} ALL=(ALL:ALL) NOPASSWD: ALL" >>/etc/sudoers

# Config ohmyzsh
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ${HOME_DIR}/.oh-my-zsh
cp ${HOME_DIR}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME_DIR}/.zshrc
sed -i 's/ZSH_THEME.*/ZSH_THEME="strug"/g' ${HOME_DIR}/.zshrc

# sudo -Hu ${DEV_USER} git clone --depth 1 https://github.com/nvm-sh/nvm.git ${DEV_HOME}/.nvm

# Boxes
git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ${HOMED_IR}/.local/share/zinit
git clone --depth 1 https://github.com/imxieke/boxes.git ${HOME_DIR}/.boxs
ln -sf ${HOME_DIR}/.boxs/conf/.zshrc ${HOME_DIR}/.zshrc

mkdir -p ${HOME_DIR}/.local/share/zinit/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${HOME_DIR}/.local/share/zinit/plugins/zsh-users---zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${HOME_DIR}/.local/share/zinit/plugins/zdharma-continuum---fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${HOME_DIR}/.local/share/zinit/plugins/zsh-users---zsh-history-substring-search
git clone https://github.com/marlonrichert/zsh-autocomplete.git ${HOME_DIR}/.local/share/zinit/plugins/marlonrichert---zsh-autocomplete
git clone https://github.com/zsh-users/zsh-completions.git ${HOME_DIR}/.local/share/zinit/plugins/zsh-users---zsh-completions
git clone https://github.com/agkozak/zsh-z.git ${HOME_DIR}/.local/share/zinit/plugins/agkozak---zsh-z
git clone https://github.com/mafredri/zsh-async.git ${HOME_DIR}/.local/share/zinit/plugins/mafredri---zsh-async
git clone https://github.com/wfxr/formarks.git ${HOME_DIR}/.local/share/zinit/plugins/wfxr---formarks
git clone https://github.com/zdharma-continuum/history-search-multi-word.git ${HOME_DIR}/.local/share/zinit/plugins/zdharma-continuum---history-search-multi-word
git clone https://github.com/trystan2k/zsh-tab-title.git ${HOME_DIR}/.local/share/zinit/plugins/trystan2k---zsh-tab-title
git clone https://github.com/romkatv/powerlevel10k.git ${HOME_DIR}/.local/share/zinit/plugins/romkatv---powerlevel10k

# Neovim
git clone --depth 1 https://github.com/imxieke/NeoCode.git ${HOME_DIR}/.config/nvim

# Config SSH
ssh-keygen -A
sed -i 's/^#ClientAliveInterval.*/ClientAliveInterval 60/g' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/^#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config

# Link vim symbol
ln -sf /usr/bin/nvim /bin/e
ln -sf /usr/bin/nvim /bin/vi
ln -sf /usr/bin/nvim /bin/vim

[ ! -d '/run/sshd' ] && mkdir -p /run/sshd
[ ! -d '/etc/supervisor/conf.d' ] && mkdir -p /etc/supervisor/conf.d
[ -f '/tmp/conf/services.conf' ] && cp /tmp/conf/services.conf /etc/supervisor/conf.d/services.conf

echo "==> Final Initialize environment"

echo "==> Fix User Permission"
chown -R ${RUN_USER}:${RUN_USER} ${HOME_DIR}
chmod -R 755 ${HOME_DIR}

echo "==> Clean Container"
rm -fr /root/.npm
rm -fr /root/.wget-hsts
rm -fr /root/.config
rm -fr /root/.local

apt autoremove -y
apt-get clean -y
apt-get autoclean -y
rm -fr /var/lib/apt/lists/*
