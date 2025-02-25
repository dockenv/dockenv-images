FROM ghcr.io/dockenv/alpine:3.20
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=83

RUN apk add --no-cache \
        php83-bcmath \
        php83-bz2 \
        php83-calendar \
        php83-common \
        php83-ctype \
        php83-curl \
        php83-dba \
        php83-dbg \
        php83-dev \
        php83-dom \
        php83-embed \
        php83-enchant \
        php83-exif \
        php83-ffi \
        php83-fileinfo \
        php83-fpm \
        php83-ftp \
        php83-gd \
        php83-gettext \
        php83-gmp \
        php83-iconv \
        php83-imap \
        php83-intl \
        php83-ldap \
        php83-mbstring \
        php83-mysqli \
        php83-mysqlnd \
        php83-odbc \
        php83-opcache \
        php83-openssl \
        php83-pcntl \
        php83-pdo \
        php83-pdo_dblib \
        php83-pdo_mysql \
        php83-pdo_odbc \
        php83-pdo_pgsql \
        php83-pdo_sqlite \
        php83-pecl-amqp \
        php83-pecl-apcu \
        php83-pecl-ast \
        php83-pecl-brotli \
        php83-pecl-couchbase \
        php83-pecl-event \
        php83-pecl-grpc \
        php83-pecl-igbinary \
        php83-pecl-imagick \
        php83-pecl-imagick-dev \
        php83-pecl-luasandbox \
        php83-pecl-lzf \
        php83-pecl-mailparse \
        php83-pecl-mcrypt \
        php83-pecl-memcache \
        php83-pecl-memcached \
        php83-pecl-mongodb \
        php83-pecl-msgpack \
        php83-pecl-opentelemetry \
        php83-pecl-protobuf \
        php83-pecl-rdkafka \
        php83-pecl-redis \
        php83-pecl-smbclient \
        php83-pecl-ssh2 \
        php83-pecl-swoole \
        php83-pecl-swoole-dev \
        php83-pecl-timezonedb \
        php83-pecl-uuid \
        php83-pecl-vips \
        php83-pecl-xdebug \
        php83-pecl-xhprof \
        php83-pecl-xhprof-assets \
        php83-pecl-xlswriter \
        php83-pecl-yaml \
        php83-pecl-zstd \
        php83-pgsql \
        php83-phar \
        php83-phpdbg \
        php83-posix \
        php83-pspell \
        php83-session \
        php83-shmop \
        php83-simplexml \
        php83-snmp \
        php83-soap \
        php83-sockets \
        php83-sodium \
        php83-spx \
        php83-sqlite3 \
        php83-sysvmsg \
        php83-sysvsem \
        php83-sysvshm \
        php83-tidy \
        php83-tokenizer \
        php83-xml \
        php83-xmlreader \
        php83-xmlwriter \
        php83-xsl \
        php83-zip \
        libstdc++-dev \
        unixodbc-dev \
        eudev-libs \
    && mv /usr/bin/php${PHP_VER} /usr/bin/php \
    && mv /usr/sbin/php-fpm${PHP_VER} /usr/sbin/php-fpm \
    && mv /usr/bin/php-config${PHP_VER} /usr/bin/php-config \
    && mv /usr/bin/phpdbg${PHP_VER} /usr/bin/phpdbg \
    && mv /usr/bin/phpize${PHP_VER} /usr/bin/phpize \
    && sed -i "s#extension#;extension#g" /etc/php${PHP_VER}/conf.d/psr.ini \
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
    && sed -i "s#;pm.max_requests =.*#pm.max_requests = 10240#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm =.*#pm = dynamic#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_pdo_sqlsrv_83_nts_alpine_318.so -O /usr/lib/php"${PHP_VER}"/modules/pdo_sqlsrv.so \
    && echo "extension=pdo_sqlsrv" > /etc/php${PHP_VER}/conf.d/20-pdo-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_sqlsrv_83_nts_alpine_318.so -O /usr/lib/php"${PHP_VER}"/modules/sqlsrv.so \
    && echo "extension=sqlsrv" > /etc/php${PHP_VER}/conf.d/20-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.8.3.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed" >> /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/composer/composer.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && wget https://github.com/dockenv/dockenv-images/releases/download/phalcon/php83-pecl-phalcon-5.7.0-r0.apk -O /tmp/phalcon.apk \
    && apk add --no-cache /tmp/phalcon.apk \
    && rm -fr /tmp/*.apk

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
