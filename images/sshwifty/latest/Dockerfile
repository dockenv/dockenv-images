FROM niruix/sshwifty:latest
LABEL org.opencontainers.image.title="SSHWifty" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Web SSH & Telnet (WebSSH & WebTelnet client) 🔮.'


USER sshwifty

EXPOSE 8182
ENTRYPOINT [ "/sshwifty.sh" ]
CMD []