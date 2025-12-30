FROM qemux/qemu-arm:latest

LABEL org.opencontainers.image.title="QEMU" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='A generic and open source machine & userspace emulator and virtualizer..'

ENV BOOT="alpine"
ENV CPU_CORES="2"
ENV RAM_SIZE="2G"
ENV DISK_SIZE="64G"

VOLUME /storage
EXPOSE 22 5900 8006

ENTRYPOINT ["/usr/bin/tini", "-s", "/run/entry.sh"]