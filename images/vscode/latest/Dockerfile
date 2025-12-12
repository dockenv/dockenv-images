FROM ghcr.io/dockenv/base:workspace

LABEL org.opencontainers.image.title="Visual Studio Code" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='The open source AI code editor.'

# https://update.code.visualstudio.com/latest/server-linux-x64/stable
# https://vscode.download.prss.microsoft.com/dbazure/download/stable/ddc367ed5c8936efe395cffeec279b04ffd7db78/vscode-server-linux-x64.tar.gz
# commit list
# https://update.code.visualstudio.com/api/commits/stable/linux-x64
# https://update.code.visualstudio.com/api/commits/stable/server-linux-x64/stable
# https://update.code.visualstudio.com/commit:ddc367ed5c8936efe395cffeec279b04ffd7db78/linux-x64/stable
# https://update.code.visualstudio.com/commit:ddc367ed5c8936efe395cffeec279b04ffd7db78/server-linux-x64/stable
# https://update.code.visualstudio.com/commit:ddc367ed5c8936efe395cffeec279b04ffd7db78/server-darwin-x64/stable
# https://update.code.visualstudio.com/commit:ddc367ed5c8936efe395cffeec279b04ffd7db78/server-darwin-arm64/stable
# https://update.code.visualstudio.com/commit:ddc367ed5c8936efe395cffeec279b04ffd7db78/server-linux-alpine/stable
# https://update.code.visualstudio.com/commit:ddc367ed5c8936efe395cffeec279b04ffd7db78/server-win32-x64/stable
# https://update.code.visualstudio.com/commit:${commit_sha}/server-${PLATFORM}-${ARCH}/insider

ENV COMMIT_ID="ddc367ed5c8936efe395cffeec279b04ffd7db78"

RUN mkdir -p /home/dockenv/.vscode/cli/serve-web \
  && cd /home/dockenv/.vscode/cli/serve-web \
  && wget "https://update.code.visualstudio.com/commit:${COMMIT_ID}/server-linux-x64/stable" -O code-stable.tar.gz \
  && wget "https://vscode.download.prss.microsoft.com/dbazure/download/stable/${COMMIT_ID}/vscode_cli_linux_x64_cli.tar.gz" -O vscode_cli.tar.gz \
  && tar -xvf code-stable.tar.gz \
  && tar -xvf vscode_cli.tar.gz \
  && mv code /usr/bin/code \
  && chmod +x /usr/bin/code \
  && rm -fr code-stable.tar.gz vscode_cli.tar.gz \
  && mv vscode-server-linux-x64 ${COMMIT_ID} \
  && chown -R dockenv:dockenv /home/dockenv/.vscode

USER dockenv

EXPOSE 8080

CMD ["code","serve-web","--host=0.0.0.0", "--port=8080"]