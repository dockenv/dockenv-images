FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/base:server

LABEL org.opencontainers.image.title="Homebrew" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='🍺 The missing package manager for macOS (or Linux).'

ARG BREW_HOME="/home/dockenv/.linuxbrew"
ARG HOMEBREW_NO_ANALYTICS=1
ARG HOMEBREW_NO_AUTO_UPDATE=1

RUN apt update -y \
  && apt-get install -y --no-install-recommends \
    gnupg \
    acl \
    bzip2 \
    ca-certificates \
    curl \
    file \
    fonts-dejavu-core \
    g++ \
    gawk \
    git \
    gpg \
    less \
    locales \
    make \
    netbase \
    openssh-client \
    patch \
    sudo \
    unzip \
    uuid-runtime \
    tzdata \
    jq \
    g++-12 \
    skopeo \
    fakeroot \
    build-essential \
  && apt-get autoremove --purge -y \
  && rm -rf /var/lib/apt/lists/* \
  && sed -i -E 's/^(USERGROUPS_ENAB\s+)yes$/\1no/' /etc/login.defs \
  && mkdir -p "${BREW_HOME}/{Caskroom,Cellar,Frameworks,include,lib,opt,sbin}" \
    "${BREW_HOME}/etc/bash_completion.d" \
    "${BREW_HOME}/share/{doc,fish,man,zsh}" \
    "${BREW_HOME}/share/fish/vendor_completions.d" \
    "${BREW_HOME}/share/man/man1" \
    "${BREW_HOME}/share/zsh/site-functions" \
    "${BREW_HOME}/var/homebrew/{linked,locks}" \
  && git clone --depth 1 https://github.com/Homebrew/brew.git "${BREW_HOME}/Homebrew" \
  && mkdir -p "${BREW_HOME}/Homebrew/Library/Taps/homebrew" \
  && git clone --depth 1 https://github.com/Homebrew/homebrew-core.git "${BREW_HOME}/Homebrew/Library/Taps/homebrew/homebrew-core" \
  && ln -sf "${BREW_HOME}/bin/brew" "${BREW_HOME}/Homebrew/bin/brew" \
  && ln -sf "${BREW_HOME}/etc/bash_completion.d/brew" "${BREW_HOME}/Homebrew/completions/bash/brew" \
  && ln -sf "${BREW_HOME}/share/zsh/site-functions/_brew" "${BREW_HOME}/Homebrew/completions/zsh/_brew" \
  && ln -sf "${BREW_HOME}/share/zsh/site-functions/_brew" "${BREW_HOME}/Homebrew/completions/zsh/_brew"

CMD ["/bin/zsh"]