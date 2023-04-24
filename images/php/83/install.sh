#!/usr/bin/env sh
###
 # @Author: Cloudflying
 # @Date: 2023-04-20 22:39:54
 # @LastEditTime: 2023-04-21 00:27:25
 # @LastEditors: Cloudflying
 # @Description: compile install php 8.3
###

export PHP_CFLAGS="-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
export PHP_CPPFLAGS="$PHP_CFLAGS"
export PHP_LDFLAGS="-Wl,-O1 -pie"

apk add --no-cache --virtual .build_deps autoconf dpkg file g++ gcc make pkgconf re2c bison \
        libc-dev \
        dpkg-dev \
        argon2-dev \
		coreutils \
		curl-dev \
		gnu-libiconv-dev \
		libsodium-dev \
		libxml2-dev \
		linux-headers \
		oniguruma-dev \
		openssl-dev \
		readline-dev \
		sqlite-dev \
        krb5-dev \
        pcre2-dev \
        bzip2-dev \
        libzip-dev \
        libxslt-dev \
        libffi-dev \
        enchant2-dev \
        gd-dev \
        gmp-dev \
        imap-dev \
        icu-dev \
        openldap-dev \
        freetds-dev \
        unixodbc-dev \
        readline-dev \
        tidyhtml-dev

apk add --no-cache ca-certificates curl tar xz openssl

adduser -u 82 -D -S -G www-data www-data

mkdir -p /etc/php/83/conf.d

gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"

cd build/php-src
# ./buildconf
./configure \
    --build="$gnuArch" \
    --with-config-file-path="/etc/php/83" \
    --with-config-file-scan-dir="/etc/php/83/conf.d" \
	--disable-cgi \
    --enable-option-checking=fatal \
    --enable-bcmath \
    --enable-calendar \
    --enable-dba \
    --enable-dba \
    --enable-exif \
	--enable-fpm \
    --enable-ftp \
    --enable-gd \
    --enable-intl \
    --enable-mbstring \
    --enable-mysqlnd \
	--enable-phpdbg \
    --enable-pcntl \
    --enable-shmop \
    --enable-soap \
    --enable-sockets \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --with-bz2 \
    --with-curl \
    --with-enchant \
    --with-ffi \
    --with-avif \
    --with-webp \
    --with-jpeg \
    --with-xpm \
    --with-freetype \
    --with-gettext \
    --with-mhash \
    --with-gmp \
    --with-pic \
    --with-password-argon2 \
    --with-sodium=shared \
    --with-pdo-sqlite=/usr \
    --with-pdo-dblib \
    --with-pdo-mysql \
    --with-pdo-pgsql \
    --with-pgsql \
    --with-sqlite3=/usr \
    --with-iconv=/usr \
    --with-imap \
    --with-imap-ssl \
    --with-ldap \
    --with-mysqli \
    --with-snmp \
    --with-tidy \
    --with-unixODBC \
    --with-openssl \
    --with-kerberos \
    --with-system-ciphers \
    --with-external-libcrypt \
    --with-password-argon2 \
    --with-external-pcre \
    --with-readline \
    --with-xsl \
    --with-zip \
    --with-pic \
    --with-zlib \
	--with-fpm-user=www-data \
	--with-fpm-group=www-data

make -j "$(nproc)"
# make install






# apk del --no-network .build_deps


# --with-pdo-oci \
# --with-oci8 \
