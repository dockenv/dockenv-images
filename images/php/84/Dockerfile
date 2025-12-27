FROM ghcr.io/dockenv/alpine:3.22
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=84

RUN echo "https://mirrors.edge.kernel.org/alpine/edge/main" > /etc/apk/repositories \
    && echo "https://mirrors.edge.kernel.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache \
        php84-bcmath \
        php84-bz2 \
        php84-calendar \
        php84-common \
        php84-ctype \
        php84-curl \
        php84-dba \
        php84-dbg \
        php84-dev \
        php84-dom \
        php84-embed \
        php84-enchant \
        php84-exif \
        php84-ffi \
        php84-fileinfo \
        php84-fpm \
        php84-ftp \
        php84-gd \
        php84-gettext \
        php84-gmp \
        php84-iconv \
        php84-intl \
        php84-ldap \
        php84-mbstring \
        php84-mysqli \
        php84-mysqlnd \
        php84-odbc \
        php84-opcache \
        php84-openssl \
        php84-pcntl \
        php84-pdo \
        php84-pdo_dblib \
        php84-pdo_mysql \
        php84-pdo_odbc \
        php84-pdo_pgsql \
        php84-pdo_sqlite \
        php84-pecl-amqp \
        php84-pecl-apcu \
        php84-pecl-ast \
        php84-pecl-brotli \
        php84-pecl-couchbase \
        php84-pecl-decimal \
        php84-pecl-event \
        php84-pecl-grpc \
        php84-pecl-igbinary \
        php84-pecl-imagick \
        php84-pecl-imagick-dev \
        php84-pecl-imap \
        php84-pecl-lzf \
        php84-pecl-mailparse \
        php84-pecl-memcache \
        php84-pecl-memcached \
        php84-pecl-mongodb \
        php84-pecl-msgpack \
        php84-pecl-opentelemetry \
        php84-pecl-protobuf \
        php84-pecl-rdkafka \
        php84-pecl-redis \
        php84-pecl-smbclient \
        php84-pecl-ssh2 \
        php84-pecl-uuid \
        php84-pecl-xdebug \
        php84-pecl-xhprof \
        php84-pecl-xhprof-assets \
        php84-pecl-xlswriter \
        php84-pecl-yaml \
        php84-pecl-zstd \
        php84-pgsql \
        php84-phar \
        php84-phpdbg \
        php84-posix \
        php84-session \
        php84-shmop \
        php84-simplexml \
        php84-snmp \
        php84-soap \
        php84-sockets \
        php84-sodium \
        php84-spx \
        php84-sqlite3 \
        php84-sysvmsg \
        php84-sysvsem \
        php84-sysvshm \
        php84-tidy \
        php84-tokenizer \
        php84-xml \
        php84-xmlreader \
        php84-xmlwriter \
        php84-xsl \
        php84-zip \
        libstdc++-dev \
        unixodbc-dev \
        eudev-libs \
    && apk add --no-cache --repository https://mirrors.edge.kernel.org/alpine/edge/community/ \
      php84-pecl-grpc \
      php84-pecl-swoole  \
      php84-pecl-swoole-dev \
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
