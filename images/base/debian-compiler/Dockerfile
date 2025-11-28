FROM ghcr.io/dockenv/debian:trixie

LABEL org.opencontainers.image.title="Debian GNU Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Debian GNU Linux latest version'

ENV DEBIAN_FRONTEND noninteractive
ENV PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

RUN apt update -y \
  && apt install -y \
    curl \
    wget \
    jq \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    apt-utils \
    build-essential \
    make cmake \
    gcc g++ \
    autoconf automake \
    re2c \
    freetds-dev \
    libargon2-dev \
    librecode-dev \
    libmcrypt-dev \
    libtidy-dev \
    libssl-dev \
    liburing-dev \
    libsnmp-dev \
    libldap-dev \
    libkrb5-dev \
    libpspell-dev \
    libpq-dev \
    libenchant-2-dev \
    libgd-dev \
    libavif-dev \
    libbison-dev \
    libxml2-dev \
    libsodium-dev \
    libxslt1-dev \
    libzip-dev \
    librabbitmq-dev \
    libevent-dev \
    libgraphicsmagick1-dev \
    libgpgme-dev \
    libmagickwand-dev \
    libleveldb-dev \
    libmcrypt-dev \
    libmemcached-dev \
    unixodbc-dev \
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
    libzstd-dev \
    libgmp-dev

CMD ["/bin/bash"]
