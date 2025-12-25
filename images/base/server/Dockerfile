FROM ghcr.io/dockenv/debian:trixie

LABEL org.opencontainers.image.title="Debian Base Server Env" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Debian Base Server Env.'

RUN apt update -y \
  && apt install -y --no-install-recommends --no-install-suggests \
    ca-certificates \
    sudo \
    openssh-server \
    zsh \
    tree \
    file \
    neovim \
    git git-lfs gh git-delta \
    gnupg \
    wget curl rsync \
    jq bat ripgrep eza btop \
    unzip 7zip p7zip p7zip-full bzip2 zstd \
  && groupadd -g 1000 dockenv \
  && useradd --uid 1000 --gid 1000 --groups dockenv -m -s /bin/zsh dockenv \
  && usermod -aG sudo dockenv \
  && echo "dockenv:dockpass" | chpasswd \
  && echo "root:dockpass" | chpasswd \
  && git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /home/dockenv/.oh-my-zsh \
  && cp /home/dockenv/.oh-my-zsh/templates/zshrc.zsh-template /home/dockenv/.zshrc \
  && sed -i 's#^ZSH_THEME=.*#ZSH_THEME="strug"#g' /home/dockenv/.zshrc \
  && chown -R ${RUN_USER}:${RUN_USER} /home/dockenv \
  && apt autoremove -y \
  && apt-get autoclean -y \
  && rm -fr /var/lib/apt/lists/*

CMD ["/bin/zsh"]