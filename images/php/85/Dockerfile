FROM ghcr.io/dockenv/alpine:3.23
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=85

RUN echo "https://mirrors.edge.kernel.org/alpine/edge/main" > /etc/apk/repositories \
    && echo "https://mirrors.edge.kernel.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache \
        php85-bcmath \
        php85-bz2 \
        php85-calendar \
        php85-common \
        php85-ctype \
        php85-curl \
        php85-dba \
        php85-dbg \
        php85-dev \
        php85-dom \
        php85-embed \
        php85-enchant \
        php85-exif \
        php85-ffi \
        php85-fileinfo \
        php85-fpm \
        php85-ftp \
        php85-gd \
        php85-gettext \
        php85-gmp \
        php85-iconv \
        php85-intl \
        php85-ldap \
        php85-mbstring \
        php85-mysqli \
        php85-mysqlnd \
        php85-odbc \
        php85-openssl \
        php85-pcntl \
        php85-pdo \
        php85-pdo_dblib \
        php85-pdo_mysql \
        php85-pdo_odbc \
        php85-pdo_pgsql \
        php85-pdo_sqlite \
        php85-pecl-amqp \
        php85-pecl-apcu \
        php85-pecl-ast \
        php85-pecl-brotli \
        php85-pecl-couchbase \
        php85-pecl-decimal \
        php85-pecl-event \
        php85-pecl-grpc \
        php85-pecl-igbinary \
        php85-pecl-imagick \
        php85-pecl-imagick-dev \
        php85-pecl-imap \
        php85-pecl-lzf \
        php85-pecl-mailparse \
        php85-pecl-memcache \
        php85-pecl-memcached \
        php85-pecl-mongodb \
        php85-pecl-msgpack \
        php85-pecl-opentelemetry \
        php85-pecl-protobuf \
        php85-pecl-rdkafka \
        php85-pecl-redis \
        php85-pecl-smbclient \
        php85-pecl-ssh2 \
        php85-pecl-uuid \
        php85-pecl-xdebug \
        php85-pecl-xhprof \
        php85-pecl-xhprof-assets \
        php85-pecl-xlswriter \
        php85-pecl-yaml \
        php85-pecl-zstd \
        php85-pgsql \
        php85-phar \
        php85-phpdbg \
        php85-posix \
        php85-session \
        php85-shmop \
        php85-simplexml \
        php85-snmp \
        php85-soap \
        php85-sockets \
        php85-sodium \
        php85-spx \
        php85-sqlite3 \
        php85-sysvmsg \
        php85-sysvsem \
        php85-sysvshm \
        php85-tidy \
        php85-tokenizer \
        php85-xml \
        php85-xmlreader \
        php85-xmlwriter \
        php85-xsl \
        php85-zip \
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
    && sed -i "s#^pm.min_spare_servers =.*#pm.min_spare_servers = 8#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm.max_spare_servers =.*#pm.max_spare_servers = 32#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#;pm.max_requests =.*#pm.max_requests = 10240#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && sed -i "s#^pm =.*#pm = dynamic#g" /etc/php${PHP_VER}/php-fpm.d/*.conf \
    && addgroup -g 1000 www \
    && adduser -H -D -G www -s /sbin/nologin -u 1000 www \
    && sed -i "s#user =.*#user = www#g" /etc/php${PHP_VER}/php-fpm.d/www.conf \
    && sed -i "s#group =.*#group = www#g" /etc/php${PHP_VER}/php-fpm.d/www.conf \
    && wget https://github.com/dockenv/dockenv-images/releases/download/ioncube/ioncube_loader_lin-musl_8.4.so -O /usr/lib/php"${PHP_VER}"/modules/ioncube.so \
    && echo "zend_extension=ioncube.so" >> /etc/php${PHP_VER}/conf.d/00-ioncube.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.8.4.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed" >> /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && chmod 755 /usr/lib/php"${PHP_VER}"/modules/*.so \
    && wget https://getcomposer.org/download/latest-stable/composer.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && rm -fr /tmp/*.apk

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
