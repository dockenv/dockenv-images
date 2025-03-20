FROM ghcr.io/dockenv/ubuntu:24.04

LABEL org.opencontainers.image.title="Ubuntu 24.04 OMZ" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Ubuntu 24.04 With Oh My Zsh.'

RUN apt update -y \
  && apt upgrade -y \
  && apt install -y wget curl git zsh sudo jq \
  && apt install -y --no-install-recommends --no-install-suggests neovim \
  && useradd -m -s /bin/zsh dockenv \
  && echo "dockenv:dockpass" | chpasswd \
  && echo "root:dockpass" | chpasswd \
  && echo "dockenv ALL=(ALL:ALL) NOPASSWD: ALL" | tee >>/etc/sudoers \
  && git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /home/dockenv/.oh-my-zsh \
  && cp /home/dockenv/.oh-my-zsh/templates/zshrc.zsh-template /home/dockenv/.zshrc \
  && sed -i 's/ZSH_THEME.*/ZSH_THEME="strug"/g' /home/dockenv/.zshrc \
  && chown -R ${RUN_USER}:${RUN_USER} /home/dockenv \
  && apt autoremove -y \
  && apt-get autoclean -y \
  && rm -fr /var/lib/apt/lists/*

CMD ["/bin/zsh"]