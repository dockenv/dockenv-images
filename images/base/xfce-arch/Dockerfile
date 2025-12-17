FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/archlinux:latest

LABEL org.opencontainers.image.title="ArchLinux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='A lightweight and flexible Linux® distribution'

ADD init.sh /tmp/init.sh

RUN bash /tmp/init.sh \
	&& rm -fr /tmp/init.sh
