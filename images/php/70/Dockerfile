FROM ghcr.io/dockenv/alpine:3.5
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=7

RUN apk add --no-cache \
        php7-apcu \
        php7-bcmath \
        php7-bz2 \
        php7-calendar \
        php7-common \
        php7-ctype \
        php7-curl \
        php7-dba \
        php7-dev \
        php7-dom \
        php7-embed \
        php7-enchant \
        php7-exif \
        php7-fpm \
        php7-ftp \
        php7-gd \
        php7-gettext \
        php7-gmp \
        php7-iconv \
        php7-imap \
        php7-intl \
        php7-json \
        php7-ldap \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqli \
        php7-mysqlnd \
        php7-odbc \
        php7-opcache \
        php7-openssl \
        php7-pcntl \
        php7-pdo \
        php7-pdo_dblib \
        php7-pdo_mysql \
        php7-pdo_odbc \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pgsql \
        php7-phar \
        php7-phpdbg \
        php7-posix \
        php7-pspell \
        php7-session \
        php7-shmop \
        php7-snmp \
        php7-soap \
        php7-sockets \
        php7-sqlite3 \
        php7-sysvmsg \
        php7-sysvsem \
        php7-sysvshm \
        php7-tidy \
        php7-wddx \
        php7-xdebug \
        php7-xml \
        php7-xmlreader \
        php7-xmlrpc \
        php7-xsl \
        php7-zip \
        php7-zlib \
        wget \
    && mv /usr/bin/php${PHP_VER} /usr/bin/php \
    && mv /usr/bin/phpdbg${PHP_VER} /usr/bin/phpdbg \
    && mv /usr/bin/phpize${PHP_VER} /usr/bin/phpize \
    && mv /usr/sbin/php-fpm${PHP_VER} /usr/sbin/php-fpm \
    && mv /usr/bin/php-config${PHP_VER} /usr/bin/php-config \
    && sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/display_errors = .*/display_errors = On/" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/date.timezone.*/date.timezone = 'Asia\/Shanghai'/" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/upload_max_filesize = .*/upload_max_filesize = 512M/" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/post_max_size = .*/post_max_size = 512M/" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/max_file_uploads =.*/max_file_uploads = 256/g" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/display_startup_errors =.*/display_startup_errors = On/g" /etc/php${PHP_VER}/php.ini \
    && sed -i "s/log_errors =.*/log_errors = On/g" /etc/php${PHP_VER}/php.ini \
    && sed -i 's/default_charset =.*/default_charset = "UTF-8"/g' /etc/php${PHP_VER}/php.ini \
    && sed -i 's/max_execution_time =.*/max_execution_time = 300/g' /etc/php${PHP_VER}/php.ini \
    && sed -i "s#^pm.max_children.*#pm.max_children = 32#" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^listen =.*#listen = 0.0.0.0:9000#" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && wget https://github.com/dockenv/dockenv-images/releases/download/ioncube/ioncube_loader_lin_7.0.so -O /usr/lib/php"${PHP_VER}"/modules/ioncube.so \
    && echo "zend_extension=ioncube.so" >> /etc/php${PHP_VER}/php.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/composer/composer-2.2.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.7.0.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed.so" >> /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && apk del wget

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
