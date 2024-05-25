FROM php:8.3-fpm-alpine
LABEL org.opencontainers.image.title="Alpine Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='a server-side scripting language.'

ENV PHP_VER=83

RUN apk add --no-cache libstdc++-dev unixodbc-dev eudev-libs \
    && mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /usr/local/etc/php/php.ini \
    && sed -i "s/display_errors = .*/display_errors = On/" /usr/local/etc/php/php.ini \
    && sed -i "s/memory_limit = .*/memory_limit = 256M/" /usr/local/etc/php/php.ini \
    && sed -i "s/date.timezone.*/date.timezone = 'Asia\/Shanghai'/" /usr/local/etc/php/php.ini \
    && sed -i "s/upload_max_filesize = .*/upload_max_filesize = 512M/" /usr/local/etc/php/php.ini \
    && sed -i "s/post_max_size = .*/post_max_size = 512M/" /usr/local/etc/php/php.ini \
    && sed -i "s/max_file_uploads =.*/max_file_uploads = 256/g" /usr/local/etc/php/php.ini \
    && sed -i "s/display_startup_errors =.*/display_startup_errors = On/g" /usr/local/etc/php/php.ini \
    && sed -i "s/log_errors =.*/log_errors = On/g" /usr/local/etc/php/php.ini \
    && sed -i 's/default_charset =.*/default_charset = "UTF-8"/g' /usr/local/etc/php/php.ini \
    && sed -i 's/max_execution_time =.*/max_execution_time = 300/g' /usr/local/etc/php/php.ini \
    && sed -i "s#^pm.max_children =.*#pm.max_children = 128#g" /usr/local/etc/php-fpm.d/*.conf \
    && sed -i "s#^pm.start_servers =.*#pm.start_servers = 32#g" /usr/local/etc/php-fpm.d/*.conf \
    && sed -i "s#^pm.min_spare_servers =.*#pm.min_spare_servers = 32#g" /usr/local/etc/php-fpm.d/*.conf \
    && sed -i "s#^pm.max_spare_servers =.*#pm.max_spare_servers = 32#g" /usr/local/etc/php-fpm.d/*.conf \
    && sed -i "s#;pm.max_requests =.*#pm.max_requests = 10240#g" /usr/local/etc/php-fpm.d/*.conf \
    && sed -i "s#^pm =.*#pm = dynamic#g" /usr/local/etc/php-fpm.d/*.conf \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_pdo_sqlsrv_83_nts_alpine_318.so -O /usr/local/lib/php/extensions/no-debug-non-zts-20230831/pdo_sqlsrv.so \
    && echo "extension=pdo_sqlsrv" >> /usr/local/etc/php/conf.d/20-pdo-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/php-mssql-ext/php_sqlsrv_83_nts_alpine_318.so -O /usr/local/lib/php/extensions/no-debug-non-zts-20230831/sqlsrv.so \
    && echo "extension=sqlsrv" >> /usr/local/etc/php/conf.d/20-sqlsrv.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/SourceGuardian/ixed.8.3.lin -O /usr/local/lib/php/extensions/no-debug-non-zts-20230831/ixed.so \
    && echo "[sourceguardian]" > /usr/local/etc/php/conf.d/sourceguardian.ini \
    && echo "zend_extension=ixed" >> /usr/local/etc/php/conf.d/sourceguardian.ini \
    && wget https://github.com/dockenv/dockenv-images/releases/download/composer/composer.phar -O /usr/bin/composer \
    && chmod +x /usr/bin/composer

EXPOSE 9000
CMD ["php-fpm","--nodaemonize"]
