#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-12-12 16:58:06
 # @LastEditTime: 2025-12-13 23:08:12
 # @LastEditors: Cloudflying
 # @Description: Code Server Entrypoint
###

RANDOM_PASSWORD=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 8)

DEFAULT_PORT=${DEFAULT_PORT:-8080}
DEFAULT_USER=${DEFAULT_USER:-dockenv}
DEFAULT_PASSWD=${DEFAULT_PASSWD:-$RANDOM_PASSWORD}
CONFIG_FILE="/home/${DEFAULT_USER}/.config/code-server/config.yaml"

mkdir -p "/home/${DEFAULT_USER}/.config/code-server"

echo -E "bind-addr: 0.0.0.0:${DEFAULT_PORT}
auth: password
password: ${DEFAULT_PASSWD}
cert: false" > "${CONFIG_FILE}"

chown -R "${DEFAULT_USER}:${DEFAULT_USER}" "/home/${DEFAULT_USER}/.config"

exec code-server