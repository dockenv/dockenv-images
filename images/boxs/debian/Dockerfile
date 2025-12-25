FROM ghcr.io/dockenv/debian:sid

LABEL org.opencontainers.image.source=https://github.com/dockenv/dockenv-images \
  org.opencontainers.image.url="https://dockenv.github.io" \
  org.opencontainers.image.description='Debian Boxs' \
  org.opencontainers.image.title="CodeSpace" \
  org.opencontainers.image.authors="Cloudflying <oss@live.hk>"

# PreDefine Variable
# LANG='en_US.UTF-8' \
# LANGUAGE='en_US.UTF-8' \
# LC_ALL='en_US.UTF-8' \
# LC_CTYPE='en_US.UTF-8'
ENV DEBIAN_FRONTEND=noninteractive
ENV DEV_USER="dockenv"
ENV DEV_PASSWD="dockenv"
ENV DEV_HOME=/home/${DEV_USER}
ENV HOME=/home/${DEV_USER}
ENV GO_VER="1.21.4"
ENV GH_VER="2.39.2"
ENV DOTNET_VER="8.0" \
  SSH_PORT=22 \
  IDE_PORT=8818 \
  IDE_PASSWD=dockenv \
  AUTHORIZED_KEYS='**None**'

ENV HOME_DIR="/home/${RUN_USER}"
ADD conf /tmp/conf

RUN bash /tmp/conf/init.sh && rm -fr /tmp/*

# SSH Don't Work
USER ${RUN_USER}
WORKDIR $HOME_DIR

# 5901 vnc port
# 6901 novnc port
# 8188 code-server default port
# 15555 tabnine port
EXPOSE 22 6080 6800 8188 15555

CMD ["/usr/bin/entrypoint"]
