#!/bin/bash
SERVER_ADDR=${SERVER_ADDR:-0.0.0.0}
SERVER_PORT=${SERVER_PORT:-5000}
PASSWORD=${PASSWORD:-ZQoPF2g6uwJE7cy4}
METHOD=${METHOD:-rc4-md5}
TIMEOUT=${TIMEOUT:-300}

while getopts "s:p:k:m:t:" OPT; do
  case $OPT in
    s)
        SERVER_ADDR=$OPTARG;;
    p)
        SERVER_PORT=$OPTARG;;
    k)
        PASSWORD=$OPTARG;;
    m)
        METHOD=$OPTARG;;
    t)
        TIMEOUT=$OPTARG;;
  esac
done

/usr/local/bin/ss-server -s $SERVER_ADDR -p $SERVER_PORT -k "$PASSWORD" -m $METHOD -t $TIMEOUT --fast-open
/usr/local/bin/ss-server -s 0.0.0.0 -p 138 -k xiaoke-m aes-256-cfb -t 60  -o tls1.2_ticket_auth_compatible -O auth_sha1_v2_compatible --fast-open