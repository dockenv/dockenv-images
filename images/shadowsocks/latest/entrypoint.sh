#!/bin/sh

[ -n "$PORT" ] && sed -i "s#6443#${PORT}#g" /etc/shadowsocks.json
[ -n "$METHOD" ] && sed -i "s#chacha20-ietf-poly1305#${METHOD}#g" /etc/shadowsocks.json
[ -n "$PASSWD" ] && sed -i "s#dockpass#${PASSWD}#g" /etc/shadowsocks.json

exec ssserver -c /etc/shadowsocks.json
