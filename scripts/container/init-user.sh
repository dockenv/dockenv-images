#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-12-14 23:48:12
 # @LastEditTime: 2025-12-14 23:49:39
 # @LastEditors: Cloudflying
 # @Description: Init User
###

RANDOM_PASSWORD=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 8)
USER=${USER:-dockenv}
USER_UID=${USER_UID:-1000}
USER_GID=${USER_GID:-1000}
USER_PASSWD=${USER_PASSWD:-$RANDOM_PASSWORD}

# || useradd -m --shell /bin/bash -u "${USER_UID}" -g root -p $(echo $USER_PASSWD | openssl passwd -6 -stdin) $USER

if [ "$(id -u "${USER}" >/dev/null 2>&1)" ]; then
    echo "User $USER already exists"
else
    echo "Creating user $USER with UID ${USER_UID} and GID ${USER_GID}"
fi


if [ -n "$(getent group "${USER_GID}")" ]; then
    echo "Group $USER_GID already exists"
else
  echo "Creating group $USER_GID with GID ${USER_GID}"
fi