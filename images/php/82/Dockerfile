FROM ghcr.io/dockenv/alpine:3.21
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=82

RUN apk add --no-cache \
        php82-bcmath \
        php82-brotli \
        php82-bz2 \
        php82-calendar \
        php82-common \
        php82-ctype \
        php82-curl \
        php82-dba \
        php82-dbg \
        php82-dev \
        php82-dom \
        php82-embed \
        php82-enchant \
        php82-exif \
        php82-ffi \
        php82-fileinfo \
        php82-fpm \
        php82-ftp \
        php82-gd \
        php82-gettext \
        php82-gmp \
        php82-iconv \
        php82-imap \
        php82-intl \
        php82-ldap \
        php82-mbstring \
        php82-mysqli \
        php82-mysqlnd \
        php82-odbc \
        php82-opcache \
        php82-openssl \
        php82-pcntl \
        php82-pdo \
        php82-pdo_dblib \
        php82-pdo_mysql \
        php82-pdo_odbc \
        php82-pdo_pgsql \
        php82-pdo_sqlite \
        php82-pecl-amqp \
        php82-pecl-apcu \
        php82-pecl-ast \
        php82-pecl-brotli \
        php82-pecl-couchbase \
        php82-pecl-event \
        php82-pecl-grpc \
        php82-pecl-igbinary \
        php82-pecl-imagick \
        php82-pecl-imagick-dev \
        php82-pecl-lzf \
        php82-pecl-maxminddb \
        php82-pecl-memcache \
        php82-pecl-memcached \
        php82-pecl-mongodb \
        php82-pecl-msgpack \
        php82-pecl-opentelemetry \
        php82-pecl-protobuf \
        php82-pecl-rdkafka \
        php82-pecl-redis \
        php82-pecl-smbclient \
        php82-pecl-ssh2 \
        php82-pecl-swoole \
        php82-pecl-swoole-dev \
        php82-pecl-timezonedb \
        php82-pecl-uuid \
        php82-pecl-vips \
        php82-pecl-xdebug \
        php82-pecl-xhprof \
        php82-pecl-xhprof-assets \
        php82-pecl-xlswriter \
        php82-pecl-yaml \
        php82-pecl-zstd \
        php82-pgsql \
        php82-phar \
        php82-phpdbg \
        php82-posix \
        php82-pspell \
        php82-session \
        php82-shmop \
        php82-simplexml \
        php82-snmp \
        php82-soap \
        php82-sockets \
        php82-sodium \
        php82-spx \
        php82-sqlite3 \
        php82-sysvmsg \
        php82-sysvsem \
        php82-sysvshm \
        php82-tidy \
        php82-tokenizer \
        php82-xml \
        php82-xmlreader \
        php82-xmlwriter \
        php82-xsl \
        php82-zip \
        libstdc++-dev \
        unixodbc-dev \
        eudev-libs \
    && mv /usr/bin/php${PHP_VER} /usr/bin/php \
    && mv /usr/sbin/php-fpm${PHP_VER} /usr/sbin/php-fpm \
    && mv /usr/bin/php-config${PHP_VER} /usr/bin/php-config \
    && mv /usr/bin/phpdbg${PHP_VER} /usr/bin/phpdbg \
    && mv /usr/bin/phpize${PHP_VER} /usr/bin/phpize \
    && echo "grpc.enable_fork_support = 1" >> /etc/php${PHP_VER}/conf.d/50_grpc.ini \
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
    && sed -i "s#^pm.min_spare_servers =.*#pm.min_spare_servers = 32#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm.max_spare_servers =.*#pm.max_spare_servers = 32#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#;pm.max_requests =.*#pm.max_requests = 10240#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm =.*#pm = dynamic#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_pdo_sqlsrv_82_nts_alpine_318.so -O /usr/lib/php"${PHP_VER}"/modules/pdo_sqlsrv.so \
    && echo "extension=pdo_sqlsrv" >> /etc/php${PHP_VER}/conf.d/20-pdo-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_sqlsrv_82_nts_alpine_318.so -O /usr/lib/php"${PHP_VER}"/modules/sqlsrv.so \
    && echo "extension=sqlsrv" >> /etc/php${PHP_VER}/conf.d/20-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/ioncube/ioncube_loader_lin_8.2.so -O /usr/lib/php"${PHP_VER}"/modules/ioncube.so \
    && echo "zend_extension=ioncube.so" >> /etc/php${PHP_VER}/conf.d/ioncube.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.8.2.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed.so" >> /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/composer/composer.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && rm -fr /tmp/*.apk

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
