FROM ghcr.io/dockenv/alpine:3.5
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=5

RUN apk add --no-cache \
        php5-apcu \
        php5-bcmath \
        php5-bz2 \
        php5-calendar \
        php5-cli \
        php5-ctype \
        php5-curl \
        php5-dba \
        php5-dbg \
        php5-dev \
        php5-dom \
        php5-embed \
        php5-enchant \
        php5-exif \
        php5-fpm \
        php5-ftp \
        php5-gd \
        php5-gettext \
        php5-gmp \
        php5-iconv \
        php5-imap \
        php5-imagick \
        php5-intl \
        php5-json \
        php5-ldap \
        php5-mcrypt \
        php5-memcache \
        php5-mssql \
        php5-mysql \
        php5-mysqli \
        php5-odbc \
        php5-opcache \
        php5-openssl \
        php5-pcntl \
        php5-pdo \
        php5-pdo_dblib \
        php5-pdo_mysql \
        php5-pdo_odbc \
        php5-pdo_pgsql \
        php5-pdo_sqlite \
        php5-pgsql \
        php5-phar \
        php5-phpdbg \
        php5-posix \
        php5-pspell \
        php5-shmop \
        php5-snmp \
        php5-soap \
        php5-sockets \
        php5-sqlite3 \
        php5-sysvmsg \
        php5-sysvsem \
        php5-sysvshm \
        php5-wddx \
        php5-xdebug \
        php5-xml \
        php5-xmlreader \
        php5-xmlrpc \
        php5-xsl \
        php5-zip \
        wget \
        eudev-libs \
    && rm -fr /usr/bin/php${PHP_VER} \
    && rm -fr /usr/bin/php-fpm${PHP_VER} \
    && rm -fr /usr/bin/php-config${PHP_VER} \
    && rm -fr /usr/bin/phpize${PHP_VER} \
    && rm -fr /usr/bin/phpdbg${PHP_VER} \
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
    && sed -i "s#^listen =.*#listen = 0.0.0.0:9000#g" /etc/php${PHP_VER}/php-fpm.conf \
    && sed -i "s#^pm.max_children.*#pm.max_children = 32#" /etc/php${PHP_VER}/php-fpm.conf \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.5.6.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed.so" >> /etc/php${PHP_VER}/conf.d/sourceguardian.ini \
    && apk del wget

    # __strtod_internal: symbol not found
    # && wget https://github.com/dockenv/dockenv-images/releases/download/ioncube/ioncube_loader_lin_5.6.so -O /usr/lib/php"${PHP_VER}"/modules/ioncube.so \
    # && echo "zend_extension=ioncube.so" >> /etc/php${PHP_VER}/php.ini \

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
