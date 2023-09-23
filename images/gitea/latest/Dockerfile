# hadolint ignore=DL3007
FROM gitea/gitea:latest
LABEL org.opencontainers.image.title="Gitea" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='self-hosted all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD'

VOLUME ["/data"]

EXPOSE 22 3000

CMD ["/bin/s6-svscan", "/etc/s6"]
