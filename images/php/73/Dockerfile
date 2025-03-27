FROM ghcr.io/dockenv/alpine:3.12
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=7

# mongodb ffi
RUN apk add --no-cache \
        php7-bcmath \
        php7-brotli \
        php7-bz2 \
        php7-calendar \
        php7-common \
        php7-ctype \
        php7-curl \
        php7-dba \
        php7-dbg \
        php7-dev \
        php7-dom \
        php7-embed \
        php7-enchant \
        php7-exif \
        php7-fileinfo \
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
        php7-maxminddb \
        php7-mbstring \
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
        php7-pecl-amqp \
        php7-pecl-apcu \
        php7-pecl-ast \
        php7-pecl-couchbase \
        php7-pecl-event \
        php7-pecl-igbinary \
        php7-pecl-imagick \
        php7-pecl-imagick-dev \
        php7-pecl-lzf \
        php7-pecl-mcrypt \
        php7-pecl-memcache \
        php7-pecl-memcached \
        php7-pecl-msgpack \
        php7-pecl-oauth \
        php7-pecl-protobuf \
        php7-pecl-redis \
        php7-pecl-ssh2 \
        php7-pecl-uuid \
        php7-pecl-vips \
        php7-pecl-xdebug \
        php7-pecl-xhprof \
        php7-pecl-xhprof-assets \
        php7-pecl-yaml \
        php7-pecl-zmq \
        php7-pgsql \
        php7-phar \
        php7-phpdbg \
        php7-posix \
        php7-pspell \
        php7-session \
        php7-shmop \
        php7-simplexml \
        php7-snmp \
        php7-soap \
        php7-sockets \
        php7-sodium \
        php7-sqlite3 \
        php7-static \
        php7-sysvmsg \
        php7-sysvsem \
        php7-sysvshm \
        php7-tidy \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlrpc \
        php7-xmlwriter \
        php7-xsl \
        php7-zip \
        libstdc++6 \
        unixodbc-dev \
        eudev-libs \
    && rm -fr /usr/bin/php \
    && rm -fr /usr/bin/phpize \
    && rm -fr /usr/bin/phpdbg \
    && rm -fr /usr/bin/php-config \
    && mv /usr/bin/php${PHP_VER} /usr/bin/php \
    && mv /usr/bin/phpdbg${PHP_VER} /usr/bin/phpdbg \
    && mv /usr/bin/phpize${PHP_VER} /usr/bin/phpize \
    && mv /usr/sbin/php-fpm${PHP_VER} /usr/sbin/php-fpm \
    && mv /usr/bin/php-config${PHP_VER} /usr/bin/php-config \
    && sed -i "s#extension#;extension#g" /etc/php7/conf.d/psr.ini \
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
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_pdo_sqlsrv_73_nts_alpine_312.so -O /usr/lib/php"${PHP_VER}"/modules/pdo_sqlsrv.so \
    && echo "extension=pdo_sqlsrv" >> /etc/php${PHP_VER}/conf.d/20-pdo-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_sqlsrv_73_nts_alpine_312.so -O /usr/lib/php"${PHP_VER}"/modules/sqlsrv.so \
    && echo "extension=sqlsrv" >> /etc/php${PHP_VER}/conf.d/20-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/ioncube/ioncube_loader_lin_7.3.so -O /usr/lib/php"${PHP_VER}"/modules/ioncube.so \
    && echo "zend_extension=ioncube.so" >> /etc/php${PHP_VER}/php.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.7.3.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed.so" >> /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/composer/composer.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
