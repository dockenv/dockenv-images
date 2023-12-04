FROM ghcr.io/dockenv/archlinux:latest
LABEL org.opencontainers.image.title="Dev Box" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Github CodeSpace/CodeSandBox Dev Box Image'

ENV DEV_USER="dockenv" \
	DEV_PASSWD="dockenv"

ENV	DEV_HOME=/home/${DEV_USER} \
	HOME=/home/${DEV_USER}

RUN echo 'Asia/Shanghai' > /etc/timezone \
	# 本地时区设定
	&& rm -fr /etc/localtime \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& pacman -Syyu --noconfirm \
	# Development Base Tools
	&& pacman -S --noconfirm base-devel \
	&& pacman -S --noconfirm zsh jq tree less cowsay cowfortune htop btop \
	# Git
	&& pacman -S --noconfirm git github-cli git-delta onefetch gitg gitui \
	# File Operation
	&& pacman -S --noconfirm xsv \
	# Program Language
	# nodejs replace with nvm
	&& pacman -S --noconfirm go python php rust jdk-openjdk dotnet-runtime dotnet-sdk \
	# Program Language Addtion
	# Node
	# && pacman -S --noconfirm npm yarn pnpm bower gulp \
	# Python
	&& pacman -S --noconfirm python-pip python-pynvim python-brotli python-pyopenssl \
	# java
	# && pacman -S --noconfirm ant maven gradle groovy \
	# PHP
	&& pacman -S --noconfirm php-apcu php-enchant php-fpm php-gd php-grpc php-igbinary php-imagick php-memcached php-mongodb \
		php-odbc php-pgsql php-redis php-snmp php-sodium php-sqlite php-tidy php-xsl \
	# Editor
	&& pacman -S --noconfirm neovim \
	# Cache Service
	&& pacman -S --noconfirm redis memcached \
	&& pacman -S --noconfirm supervisor sudo \
	# File && Code Tools
	&& pacman -S --noconfirm fd bat bat-extras skim ripgrep the_silver_searcher fzf exa \
	# Docker Tools
	# ctop like linux top
	# crun replace runc, crun is faster than runc and has a much lower memory footprint.
	# podman --runtime /usr/bin/crun run --rm --memory 4M fedora echo it works
	# cosign sign container image
	# dive A tool for exploring each layer in a docker image
	# skopeo Work with remote images registries - retrieving information, images, signing content
	&& pacman -S --noconfirm docker ctop container-diff crun cosign dive skopeo \
	# Remote
	&& pacman -S --noconfirm openssh \
	# Compress
	&& pacman -S --noconfirm bzip2 unzip unarchiver zip zstd unrar gzip p7zip xz \
	# Downloader
	&& pacman -S --noconfirm aria2 wget curl axel \
	# NetWork Tools
	&& pacman -S --noconfirm procps gnu-netcat htop mtr rsync traceroute dnsutils iputils lsof iproute2 whois corkscrew socat \
		iperf iperf3 httpie curlie \
	# Create Non-root User
	&& useradd -d /home/${DEV_USER} -m -s /bin/zsh ${DEV_USER} \
    && echo "${DEV_USER}:${DEV_PASSWD}" | chpasswd \
    && echo "root:${DEV_PASSWD}" | chpasswd \
    && echo "${DEV_USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers \
	# Install ohmyzsh
	&& git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ${DEV_HOME}/.oh-my-zsh \
	&& cp ${DEV_HOME}/.oh-my-zsh/templates/zshrc.zsh-template ${DEV_HOME}/.zshrc \
    && sed -i 's/ZSH_THEME.*/ZSH_THEME="strug"/g' ${DEV_HOME}/.zshrc \
	&& git clone --depth 1 https://github.com/nvm-sh/nvm.git ${DEV_HOME}/.nvm \
	&& echo 'export NVM_DIR="$HOME/.nvm"' >> ${DEV_HOME}/.zshrc \
	&& echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ${DEV_HOME}/.zshrc \
	&& echo "export NPM_CONFIG_CACHE=\"$HOME/.npm\"" >> ${DEV_HOME}/.zshrc \
	&& echo "export NPM_CONFIG_STORE_DIR=\"$HOME/.pnpm\"" >> ${DEV_HOME}/.zshrc \
	&& echo "export YARN_CACHE_FOLDER=\"$HOME/.yarn\"" >> ${DEV_HOME}/.zshrc \
	&& chmod -R 755 ${DEV_HOME} \
	&& chown -R ${DEV_USER}:${DEV_USER} ${DEV_HOME} \
	&& rm -fr /var/cache/pacman/pkg/* \
	&& rm -fr /var/lib/pacman/sync/*

USER ${DEV_USER}