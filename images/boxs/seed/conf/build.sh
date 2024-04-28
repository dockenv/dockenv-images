#!/usr/bin/env bash

USER='www'
VERSION=$(bin/aria2c -v | grep 'aria2 version' | awk -F ' ' '{print $3}')
CONF=$(pwd)/aria2c.conf

# 检查环境 不足则补充
env() {
    BIT=$(getconf LONG_BIT)
    USER_EXIST=$(grep '^www:' /etc/passwd) # 为空则不存在
    if [[ -z ${USER_EXIST} ]]; then
        useradd ${USER}
    fi
}

clear_env() {
    if [[ -z $(command -v sudo) ]]; then
        echo ' command sudo not found'
    fi

    if [[ -z $(command -v curl) ]]; then
        echo ' command curl not found'
    fi

    userdel ${USER}
}

do_start() {
    CMD="sudo -Hu ${USER} bin/aria2c --conf-path=${CONF} -D >> aria2c.run.log"
    ${CMD}

    PID=$(ps -aux | grep -v grep | grep aria2c | awk -F ' ' '{print $2}')
    if [[ ! -z ${PID} ]]; then
        echo "==> Aria2c is start complete pid: ${PID}"
    fi
}

do_stop() {
    echo "==> Aria2c is running Stop it now"
    PID=$(ps -aux | grep -v grep | grep aria2c | awk -F ' ' '{print $2}')

    if [[ -z ${PID} ]]; then
        echo "==> Aria2c is running, pid: ${PID} , Stop it Now"
    fi
    kill -9 ${PID}
}

do_reload() {
    do_stop
    do_start
}

# 更新 aria2c 依赖的数据
do_update() {
    TRACKERS=$(curl -sL https://cdn.jsdelivr.net/gh/XIU2/TrackersListCollection@master/all_aria2.txt)
    sed -i "/^bt-tracker=/d" ${CONF}
    echo "
bt-tracker=${TRACKERS}" >>${CONF}
    echo "Update Tracker Complete"
}

usage() {
    echo "Aria Command Line Helper
"

}

do_get_hash() {
    CMD="bin/aria2c --bt-metadata-only=true --bt-save-metadata=true --bt-tracker= magnet:?xt=urn:btih:"$1
    $CMD
}

case $1 in
r | -r | run)
    do_start
    ;;
reload)
    do_reload
    ;;
stop)
    do_stop
    ;;
u | -u | update)
    do_update
    ;;
-d | get-hash)
    do_get_hash $2
    ;;
* | help)
    usage
    ;;
esac
