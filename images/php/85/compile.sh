#!/usr/bin/env bash

SWOOLE_VERSION="6.0.2"

GIT_COMMIT_ID="cce0efdff87de3cea3e2326cdb36c8adc58a4bdb"
SOURCE_URL="https://github.com/php/php-src/archive/${GIT_COMMIT_ID}.zip"
SWOOLE_URL="https://github.com/swoole/swoole-src/archive/refs/tags/v${SWOOLE_VERSION}.tar.gz"

__depency()
{
  apt update
  apt install -y unzip curl wget

  # libzookeeper-st-dev
  apt install -y \
    build-essential \
    make \
    automake \
    autoconf \
    gcc \
    g++ \
    pkg-config \
    libxml2-dev \
    libssl-dev \
    libsqlite3-dev \
    libkrb5-dev \
    librabbitmq-dev \
    libevent-dev \
    libgraphicsmagick1-dev \
    libgpgme-dev \
    libmagickwand-dev \
    libleveldb-dev \
    libmcrypt-dev \
    libmemcached-dev \
    librdkafka-dev \
    libsmbclient-dev \
    libssh2-1-dev \
    libyaml-dev \
    libzookeeper-mt-dev \
    libffi-dev \
    libonig-dev \
    libsqlite3-dev \
    libcurl4-openssl-dev \
    libreadline-dev \
    libgmp-dev \
    librecode-dev \
    libmcrypt-dev \
    libmsgpack-dev \
    libpspell-dev \
    libpq-dev \
    libxml2-dev \
    libsodium-dev \
    libxslt1-dev \
    libzip-dev \
    libtidy-dev \
    libssl-dev \
    libsnmp-dev \
    libldap-dev \
    libbison-dev \
    libxpm-dev \
    libjpeg-dev \
    libwebp-dev \
    libmagic-dev \
    libbrotli-dev \
    libzstd-dev \
    libldap-dev \
    zlib1g-dev \
    libenchant-2-dev \
    libglib2.0-dev \
    libgd-dev \
    libc-client2007e-dev \
    unixodbc-dev \
    freetds-dev \
    re2c \
    libgeoip-dev \
    libavif-dev \
    libcapstone-dev \
    libedit-dev
}

_php()
{
  if [[ ! -f "php.zip" ]]; then
    wget -O php.zip ${SOURCE_URL}
  fi

  # unzip php.zip
  # mv php-src-${GIT_COMMIT_ID} php-src

  PREFIX_PHP="/usr/local/dockenv/php/85"
  cd php-src
  ./configure \
    --prefix=${PREFIX_PHP} \
    --bindir="${PREFIX_PHP}"/bin \
    --sbindir="${PREFIX_PHP}"/sbin \
    --libexecdir="${PREFIX_PHP}"/libexec \
    --sysconfdir="${PREFIX_PHP}"/etc \
    --libdir="${PREFIX_PHP}"/lib \
    --includedir="${PREFIX_PHP}"/include \
    --datarootdir="${PREFIX_PHP}"/share \
    --with-config-file-path="${PREFIX_PHP}"/etc \
    --with-config-file-scan-dir="${PREFIX_PHP}"/conf.d \
    --with-fpm-user=www \
    --with-fpm-group=www \
    --enable-fpm \
    --enable-bcmath \
    --enable-calendar \
    --enable-exif \
    --enable-ftp \
    --with-ftp-ssl \
    --enable-fpm \
    --enable-mbstring \
    --enable-mysqlnd \
    --with-mysqlnd-ssl \
    --enable-pcntl \
    --enable-shmop \
    --enable-soap \
    --enable-sockets \
    --enable-sysvsem \
    --enable-sysvmsg \
    --enable-sysvshm \
    --with-bz2 \
    --with-curl \
    --with-enchant \
    --with-gettext \
    --with-ffi \
    --enable-gd \
    --with-avif \
    --with-webp \
    --with-jpeg \
    --with-xpm \
    --with-snmp \
    --with-freetype \
    --with-gmp \
    --with-iconv \
    --with-ldap \
    --with-ldap-sasl \
    --with-libedit \
    --with-mhash \
    --with-mysqli=mysqlnd \
    --with-openssl \
    --with-pcre-jit \
    --with-pdo-mysql=mysqlnd \
    --with-pdo-pgsql \
    --with-pic \
    --with-pgsql \
    --with-readline \
    --with-sodium \
    --with-tidy \
    --with-expat \
    --with-unixODBC \
    --with-xsl \
    --with-zip \
    --with-zlib \
    --with-capstone \
    --with-external-pcre

  make -j"$(nproc)"
  make install
}

_swoole()
{
  if [[ ! -f "swoole.tar.gz" ]]; then
    wget -O swoole.tar.gz ${SWOOLE_URL}
  fi
  tar -xvf swoole.tar.gz
  cd swoole-src-${SWOOLE_VERSION}
  phpize
  ./configure \
    --enable-sockets \
    --enable-openssl \
    --enable-swoole \
    --enable-mysqlnd \
    --enable-brotli \
    --enable-zstd \
    --enable-swoole-curl \
    --enable-swoole-pgsql \
    --enable-swoole-coro-time \
    --enable-swoole-sqlite \
    --with-php-config=/usr/local/dockenv/php/85/bin/php-config
    make -j"$(nproc)"
    make install
}

_swoole