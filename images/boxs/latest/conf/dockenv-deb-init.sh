#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2024-04-12 23:37:30
 # @LastEditTime: 2024-04-13 00:06:40
 # @LastEditors: Cloudflying
 # @Description: Debian Init for docker， Optimize Storage Space
###

# 下载二进制文件 并赋予执行权限
# @param $1 Save Name Or Platform
# @param $2 Platform is exist
# Common Executable Binary,example shell php python
# ~/.bin/all
# Linux
# ~/.bin/lin
# macOS
# ~/.bin/mac
add_bin()
{
    BIN_DIR=${HOME}/.bin
    if [[ "${1}" != 'lin' ]]; then
        SAVE_PATH="${BIN_DIR}/lin/$2"
    elif [[ "${1}" != 'mac' ]]; then
        SAVE_PATH=="${BIN_DIR}/mac/$2"
    else
        SAVE_PATH="${BIN_DIR}/$2"
    fi
    wget -c $1 -O $SAVE_PATH
    chmod +x ${SAVE_PATH}
}

# short package install command
pkg_add()
{
    apt-get install -y --no-install-recommends --no-install-suggests $@
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

# 初始化 Node 环境
node_env()
{
        npm i -g webpack yarn eslint @unibeautify/cli typescript
        npm i -g typescript-language-server vim-language-server
}

php_env()
{
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
    sed -i "s/error_reporting = .*/error_reporting = E_ALL/"                /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/display_errors = .*/display_errors = On/"                     /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/memory_limit = .*/memory_limit = 256M/"                       /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/date.timezone.*/date.timezone = 'Asia\/Shanghai'/"            /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 512M/"         /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/post_max_size = .*/post_max_size = 512M/"                     /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/max_file_uploads =.*/max_file_uploads = 256/g"                /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/display_startup_errors =.*/display_startup_errors = On/g"     /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/log_errors =.*/log_errors = On/g"                             /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/default_charset =.*/default_charset = "UTF-8"/g"              /etc/php/${PHP_VER}/*/php.ini
    sed -i "s/max_execution_time =.*/max_execution_time = 300/g"            /etc/php/${PHP_VER}/*/php.ini
    sed -i "s#^pm.max_children.*#pm.max_children = 32#"                     /etc/php/${PHP_VER}/fpm/php-fpm.conf
}

composer_app()
{
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

# Config code-server
vscode_init()
{
    HOME_DIR=${HOME}
    if [[ -z "$(command -v code-server)" ]]; then
        CODE_SERVER_LATEST_VER=$(curl -sI https://github.com/coder/code-server/releases/latest | grep '/releases/tag' | grep -Eo '/v\S+.[0-9]' | sed 's#/v##g')
        # sudo systemctl enable --now code-server@$USER
        CODE_SERVER_URL="https://github.com/coder/code-server/releases/download/v${CODE_SERVER_LATEST_VER}/code-server_${CODE_SERVER_LATEST_VER}_amd64.deb"
        wget -c ${CODE_SERVER_URL} -O /tmp/code-server_${CODE_SERVER_LATEST_VER}_amd64.deb
        dpkg -i /tmp/code-server_${CODE_SERVER_LATEST_VER}_amd64.deb

        mkdir -p ${HOME_DIR}/.code-server/exts
        mkdir -p ${HOME_DIR}/.code-server/User
        mkdir -p ${HOME_DIR}/.config/code-server

    cat > ${HOME_DIR}/.config/code-server/config.yaml <<<EOF
    bind-addr: 0.0.0.0:8818
    auth: password
    password: dockenv
    cert: false
    user-data-dir: .code-server
    extensions-dir: .code-server/exts
    EOF

    cat > ${HOME_DIR}/.code-server/User/settings.json <<< EOF
    {
        "workbench.colorTheme": "Solarized Light",
        "sublimeTextKeymap.promptV3Features": true,
        "editor.multiCursorModifier": "ctrlCmd",
        "editor.snippetSuggestions": "top",
        "editor.formatOnPaste": true,
        "workbench.iconTheme": "vscode-icons",
        "window.menuBarVisibility": "classic",
        "database-client.highlightSQLBlock": true,
        "database-client.showUser": true,
        "database-client.showTrigger": true,
        "database-client.showQuery": true,
        "database-client.showFilter": true,
        "database-client.escapedAllObjectName": true,
        "tabnine.experimentalAutoImports": true,
        "tabnine.receiveBetaChannelUpdates": true,
        "editor.fontSize": 16,
        "extensions.autoUpdate": "onlyEnabledExtensions"
    }
    EOF
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

        mkdir -p ${HOME_DIR}/.config/TabNine
        cp -fr /tmp/conf/tabnine_config.json ${HOME_DIR}/.config/TabNine/tabnine_config.json
    fi
}

# install extension for code-server
ext_add()
{
    code-server --extensions-dir /home/boxs/.code-server/exts --install-extension $@
}

case "$1" in
    node)
        apt install -y nodejs npm
    ;;
    2|3) echo 2 or 3
    ;;
    *) echo default
    ;;
esac
