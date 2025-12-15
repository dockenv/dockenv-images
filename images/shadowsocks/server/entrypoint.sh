#!/bin/sh
###
 # @Author: Cloudflying
 # @Date: 2025-04-10 09:16:44
 # @LastEditTime: 2025-12-16 00:34:55
 # @LastEditors: Cloudflying
 # @Description:
###

RANDOM_PASSWORD=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 8)
PORT=${PORT:-6443}
METHOD=${METHOD:-2022-blake3-chacha20-poly1305}
PASSWD=${PASSWD:-${RANDOM_PASSWORD}}
TIMEOUT=${TIMEOUT:-300}
CORES=$(expr $(nproc) \* 2)

echo "Shadowsocks Password: ${PASSWD} Method: ${METHOD} PORT: ${PORT}"

exec ssserver \
  --server-addr "0.0.0.0:${PORT}" \
  --password ${PASSWD} \
  --encrypt-method ${METHOD} \
  --timeout ${TIMEOUT} \
  --udp-timeout ${TIMEOUT} \
  --tcp-no-delay \
  --tcp-fast-open \
  --tcp-keep-alive 300 \
  --nofile 65535