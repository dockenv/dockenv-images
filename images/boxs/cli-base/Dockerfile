FROM swr.ap-southeast-3.myhuaweicloud.com/dockenv/debian:latest
LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk" \
        org.opencontainers.image.source=https://github.com/dockenv/dockenv

ADD build.sh /tmp/build.sh

RUN chmod +x /tmp/build.sh && bash /tmp/build.sh
