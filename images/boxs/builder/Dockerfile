FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/archlinux:latest

LABEL MAINTAINER="Cloudflying" \
    MAIL="oss@live.hk" \
    org.opencontainers.image.source=https://github.com/dockenv/dockenv-images\
    org.opencontainers.image.description='Archlinux Builder'

ENV RUN_USER="dockenv" \
	PASSWD="dockenv" \
	AUTHORIZED_KEYS='**None**' \
	DEBIAN_FRONTEND=noninteractive

ENV HOME_DIR=/home/$RUN_USER

COPY conf/makepkg.conf /etc/makepkg.conf

# electron12 electron13 electron16 is abandoned
# asar electron electron17 electron18 electron19
# gtk2 xdg-utils
# nodejs npm \
RUN pacman -Syy \
    && pacman -S --noconfirm --overwrite \* archlinux-keyring \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman -Su --noconfirm --overwrite \* \
    && pacman -S --noconfirm --overwrite \* glibc \
    && pacman -S --noconfirm --overwrite \* \
        openssh git zsh neovim net-tools wget axel curl axel namcap \
        base-devel dpkg cmake \
        file tree which \
        unarchiver unzip unrar p7zip \
        meson nss alsa-lib libsecret \
        go python python-pip \
        squashfs-tools \
    && useradd -d /home/${RUN_USER} -c "Packages Builder" -m -s /bin/zsh ${RUN_USER} \
	  && echo "${RUN_USER}:${PASSWD}" | chpasswd \
	  && echo "root:${PASSWD}" | chpasswd \
    && echo "${RUN_USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ${HOME_DIR}/.oh-my-zsh \
    && cp ${HOME_DIR}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME_DIR}/.zshrc \
    && sed -i 's/ZSH_THEME.*/ZSH_THEME="strug"/g' ${HOME_DIR}/.zshrc \
    && chown -R ${RUN_USER}:${RUN_USER} ${HOME_DIR} \
    && ssh-keygen -A \
    && sed -i 's/^#ClientAliveInterval.*/ClientAliveInterval 60/g' /etc/ssh/sshd_config \
    && sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config \
    && sed -i "s/^#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g" /etc/ssh/sshd_config \
    && ln -s /bin/nvim /bin/e \
    && ln -s /bin/nvim /bin/vim \
    && ln -s /bin/nvim /bin/vi \
    && pacman -Scc --noconfirm \
    && rm -fr /var/cache/pacman/*

USER ${RUN_USER}
WORKDIR ${HOME_DIR}

EXPOSE 22 80

CMD ["/bin/zsh"]
#sudo service ssh start
