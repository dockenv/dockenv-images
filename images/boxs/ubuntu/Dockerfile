FROM ghcr.io/dockenv/ubuntu:latest
LABEL org.opencontainers.image.title="CodeSpace" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Github CodeSpace/CodeSandBox Dev Image'

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
	&& apt upgrade -y
	&& apt install -y ca-certificates \
	# Editor
	&& apt install -y neovim vim \
	# Python Language
	&& apt install -y python3 python3-pip python3-apt python3-software-properties python3-neovim \
	&& apt install -y lsb-release apt-transport-https apt-utils software-properties-common \
    && apt install -y locales supervisor sudo openssh-server \
    && apt install -y 7zip brotli bzip2 lunzip lzip rpm rar unalz unar unrar unzip unrar-free zip zstd gzip \
        p7zip p7zip-full p7zip-rar \
	# Utils Tools
    && apt install -y fzf bat zsh git jq tree screen less iftop enca \
	# Downloader
    && apt install -y wget curl httpie axel \
	# Network Tools
    && apt install -y lsof net-tools procps htop netcat-openbsd rsync iproute2 whois tcpdump \
    && apt install -y iso-codes openssl gnupg universal-ctags strace psmisc file psutils dnsutils expect
