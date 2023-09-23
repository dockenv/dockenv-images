# Debian Bullseye (11)
FROM debian:bullseye
LABEL org.opencontainers.image.title="Debian GNU Linux" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Debian GNU Linux Bullseye'

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
ENV VERSION_CODENAME=bullseye

RUN . /etc/os-release \
    && echo "deb http://repo.huaweicloud.com/${ID} ${VERSION_CODENAME} main" > /etc/apt/sources.list \
    && echo "deb http://repo.huaweicloud.com/${ID} ${VERSION_CODENAME} contrib" >> /etc/apt/sources.list \
    && echo "deb http://repo.huaweicloud.com/${ID} ${VERSION_CODENAME} non-free" >> /etc/apt/sources.list \
    && echo "deb http://repo.huaweicloud.com/${ID}-security bullseye-security main" >> /etc/apt/sources.list \
    && echo "deb http://repo.huaweicloud.com/${ID}-security bullseye-security contrib" >> /etc/apt/sources.list \
    && echo "deb http://repo.huaweicloud.com/${ID}-security bullseye-security non-free" >> /etc/apt/sources.list

CMD ["/bin/bash"]
