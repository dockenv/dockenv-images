FROM ghcr.io/dockenv/debian:sid

LABEL MAINTAINER="Cloudflying" \
  MAIL="oss@live.hk" \
  org.opencontainers.image.source=https://github.com/dockenv/dockenv-images \
  org.opencontainers.image.description='Debian Boxs'

# PreDefine Variable
# LANG='en_US.UTF-8' \
# LANGUAGE='en_US.UTF-8' \
# LC_ALL='en_US.UTF-8' \
# LC_CTYPE='en_US.UTF-8'
ENV RUN_USER="dockenv" \
  USER_PASSWD="dockenv" \
  AUTHORIZED_KEYS='**None**' \
  DEBIAN_FRONTEND=noninteractive \
  SSH_PORT=22 \
  IDE_PORT=8818 \
  IDE_PASSWD=dockenv

ENV HOME_DIR=/home/$RUN_USER
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
