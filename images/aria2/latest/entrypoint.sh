#!/usr/bin/env sh
###
# @Author: Cloudflying
# @Date: 2021-09-19 01:25:54
 # @LastEditTime: 2025-12-30 14:37:40
 # @LastEditors: Cloudflying
# @Description:
###
ARIA2_CONF='/etc/aria2c/aria2c.conf'

UID=${UID:-'1000'}
USER=${USER:-'dockenv'}
GROUP=${GROUP:-${USER}}
PASSWORD=${PASSWORD:-'dockpass'}
WEBUI_PORT=${WEBUI_PORT:-'8080'}
HOST_IP=$(hostname -i)

if [ -z "${ARIA2_PORT}" ]; then
  ARIA2_PORT=6800
fi

if [ -z "${DHT_PORT}" ]; then
  DHT_PORT='6881-6999'
fi

if [ -z "${RPC_SECRET}" ]; then
  RPC_SECRET='dockpass'
fi

touch /data/logs/aria2c.log
adduser -D -u "${UID}" -s /bin/sh "${USER}"
chown -R "${USER}:${GROUP}" /data
chmod 755 -R /data

if [ ! -f "/etc/aria2c/aria2c.conf" ] ; then
  echo "Aria2 Conf Not Found, Exiting..."
  exit 1
fi

sed -i "s/rpc-listen-port=.*/rpc-listen-port=${ARIA2_PORT}/g" ${ARIA2_CONF}
sed -i "s/rpc-secret=.*/rpc-secret=${RPC_SECRET}/g" ${ARIA2_CONF}
sed -i "s/dht-listen-port.*/dht-listen-port=${DHT_PORT}/g" ${ARIA2_CONF}

echo "
    Welcome to Use Aria2c Container
Web UI: ${HOST_IP}:${WEBUI_PORT}
Aria2 Port : ${HOST_IP}:${ARIA2_PORT}
RPC Secret : ${RPC_SECRET}
"

su - "${USER}" -c "aria2c --conf-path=/etc/aria2c/aria2c.conf" 2>&1 &
su - "${USER}" -c "darkhttpd /var/www --port ${WEBUI_PORT}" > /tmp/darkhttpd.log 2>&1 &
