FROM ghcr.io/dockenv/debian:latest

LABEL org.opencontainers.image.title="SSHD" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Secure Shell'

ENV DEBIAN_FRONTEND=noninteractive
ENV AUTHORIZED_KEYS="**None**"

ADD entrypoint.sh /bin/entrypoint.sh

# Install packages
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get -y install openssh-server \
	&& mkdir -p /var/run/sshd \
	&& sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
	&& sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config \
	&& sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
	&& apt-get clean all \
	&& rm -r /var/lib/apt/lists/* \
  && chmod +x /bin/entrypoint.sh

EXPOSE 22 80 666 3000 7681 8888
CMD ["/run.sh"]