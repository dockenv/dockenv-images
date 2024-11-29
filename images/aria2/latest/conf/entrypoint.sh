#!/usr/bin/env sh
###
# @Author: Cloudflying
# @Date: 2021-09-19 01:25:54
# @LastEditTime: 2024-11-29 23:30:02
# @LastEditors: Cloudflying
# @Description:
###
ARIA2_CONF='/etc/aria2c/aria2c.conf'
if [ -z "${ARIA2_PORT}" ]; then
  ARIA2_PORT=6800
fi

if [ -z "${DHT_PORT}" ]; then
  DHT_PORT='6881-6999'
fi

if [ -z "${RPC_SECRET}" ]; then
  RPC_SECRET='dockpass'
fi

sed -i "s/rpc-listen-port=.*/rpc-listen-port=${ARIA2_PORT}/g" ${ARIA2_CONF}
sed -i "s/rpc-secret=.*/rpc-secret=${RPC_SECRET}/g" ${ARIA2_CONF}
sed -i "s/dht-listen-port.*/dht-listen-port=${DHT_PORT}/g" ${ARIA2_CONF}

echo "
    Welcome to Use Aria2c Container

Aria2 Port : 127.0.0.1:${ARIA2_PORT}
RPC Secret : ${RPC_SECRET}
"
aria2c --conf-path=/etc/aria2c/aria2c.conf
