FROM php:8.3-fpm-alpine
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=83

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/display_errors = .*/display_errors = On/" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/memory_limit = .*/memory_limit = 256M/" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/date.timezone.*/date.timezone = 'Asia\/Shanghai'/" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/upload_max_filesize = .*/upload_max_filesize = 512M/" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/post_max_size = .*/post_max_size = 512M/" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/max_file_uploads =.*/max_file_uploads = 256/g" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/display_startup_errors =.*/display_startup_errors = On/g" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i "s/log_errors =.*/log_errors = On/g" /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i 's/default_charset =.*/default_charset = "UTF-8"/g' /usr/local/etc/php${PHP_VER}/php.ini \
    && sed -i 's/max_execution_time =.*/max_execution_time = 300/g' /usr/local/etc/php${PHP_VER}/php.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_pdo_sqlsrv_83_nts_alpine_318.so
    -O /usr/local/lib/php/extensions/no-debug-non-zts-20230831/pdo_sqlsrv.so \
    && echo "extension=pdo_sqlsrv" >> /usr/local/etc/php/conf.d/20-pdo-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_sqlsrv_83_nts_alpine_318.so
    -O /usr/local/lib/php/extensions/no-debug-non-zts-20230831/sqlsrv.so \
    && echo "extension=sqlsrv" >> /usr/local/etc/php/conf.d/20-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.8.3.lin -O /usr/lib/php"${PHP_VER}"/modules/ixed.so \
    && echo "[sourceguardian]" > /usr/local/etc/php/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed" >> /usr/local/etc/php/conf.d/sourceguardian.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/composer/composer.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer
    # && sed -i "s#^pm.max_children.*#pm.max_children = 32#" /usr/local/etc/php${PHP_VER}/php-fpm.d/*.conf \
    # && sed -i "s#^listen =.*#listen = 0.0.0.0:9000#" /usr/local/etc/php${PHP_VER}/php-fpm.d/*.conf

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
