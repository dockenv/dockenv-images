FROM ghcr.io/dockenv/base:workspace

LABEL org.opencontainers.image.title="Code Server" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='VS Code in the Browser.'

ENV API_URL="https://api.github.com/repos/coder/code-server/releases/latest"

RUN VERSIONS=$(curl -s ${API_URL} | jq -r .tag_name | awk -F "v" '{print $2}') \
  && wget https://github.com/coder/code-server/releases/download/v${VERSIONS}/code-server_${VERSIONS}_amd64.deb \
  && dpkg -i code-server_${VERSIONS}_amd64.deb \
  && rm -fr code-server_${VERSIONS}_amd64.deb

USER dockenv

EXPOSE 8080

ENTRYPOINT [ "/bin/entrypoint.sh" ]