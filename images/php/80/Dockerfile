FROM ghcr.io/dockenv/alpine:3.16
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=8

# php8-pecl-couchbase: dynamic library not found, but it exist
RUN apk add --no-cache \
            php8-bcmath \
            php8-brotli \
            php8-bz2 \
            php8-calendar \
            php8-common \
            php8-ctype \
            php8-curl \
            php8-dba \
            php8-dbg \
            php8-dev \
            php8-dom \
            php8-embed \
            php8-enchant \
            php8-exif \
            php8-ffi \
            php8-fileinfo \
            php8-fpm \
            php8-ftp \
            php8-gd \
            php8-gettext \
            php8-gmp \
            php8-iconv \
            php8-imap \
            php8-intl \
            php8-ldap \
            php8-mbstring \
            php8-mysqli \
            php8-mysqlnd \
            php8-odbc \
            php8-opcache \
            php8-openssl \
            php8-pcntl \
            php8-pdo \
            php8-pdo_dblib \
            php8-pdo_mysql \
            php8-pdo_odbc \
            php8-pdo_pgsql \
            php8-pdo_sqlite \
            php8-pecl-amqp \
            php8-pecl-apcu \
            php8-pecl-ast \
            php8-pecl-event \
            php8-pecl-igbinary \
            php8-pecl-imagick \
            php8-pecl-imagick-dev \
            php8-pecl-lzf \
            php8-pecl-mcrypt \
            php8-pecl-memcache \
            php8-pecl-memcached \
            php8-pecl-mongodb \
            php8-pecl-msgpack \
            php8-pecl-oauth \
            php8-pecl-protobuf \
            php8-pecl-psr \
            php8-pecl-rdkafka \
            php8-pecl-redis \
            php8-pecl-ssh2 \
            php8-pecl-swoole \
            php8-pecl-swoole-dev \
            php8-pecl-uuid \
            php8-pecl-vips \
            php8-pecl-xdebug \
            php8-pecl-xhprof \
            php8-pecl-xhprof-assets \
            php8-pecl-yaml \
            php8-pecl-zstd \
            php8-pgsql \
            php8-phar \
            php8-phpdbg \
            php8-posix \
            php8-pspell \
            php8-session \
            php8-shmop \
            php8-simplexml \
            php8-snmp \
            php8-soap \
            php8-sockets \
            php8-sodium \
            php8-sqlite3 \
            php8-sysvmsg \
            php8-sysvsem \
            php8-sysvshm \
            php8-tideways_xhprof \
            php8-tidy \
            php8-tokenizer \
            php8-xml \
            php8-xmlreader \
            php8-xmlwriter \
            php8-xsl \
            php8-zip \
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
    && sed -i "s#^listen =.*#listen = 0.0.0.0:9000#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm.max_children =.*#pm.max_children = 128#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm.start_servers =.*#pm.start_servers = 32#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm.min_spare_servers =.*#pm.min_spare_servers = 8#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm.max_spare_servers =.*#pm.max_spare_servers = 32#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#;pm.max_requests =.*#pm.max_requests = 10240#g" >> /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm =.*#pm = dynamic#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_pdo_sqlsrv_80_nts_alpine_316.so -O /usr/lib/php"${PHP_VER}"/modules/pdo_sqlsrv.so \
    && echo "extension=pdo_sqlsrv" >> /etc/php${PHP_VER}/conf.d/20-pdo-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_sqlsrv_80_nts_alpine_316.so -O /usr/lib/php"${PHP_VER}"/modules/sqlsrv.so \
    && echo "extension=sqlsrv" >> /etc/php${PHP_VER}/conf.d/20-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.8.0.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed.so" >> /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/composer/composer.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
