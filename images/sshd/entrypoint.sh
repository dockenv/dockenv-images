#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-04-10 09:16:44
 # @LastEditTime: 2026-01-13 00:28:03
 # @LastEditors: Cloudflying
 # @Description: Docker Entrypoint
###
DEFAULT_PASSWD=$(head -n 1 /dev/random | sha256sum | head -c 12)
USERNAME=${USERNAME:-"dockenv"}
PASSWD=${PASSWD:-"dockenv"}
HOST_IP=$(hostname -i)
HOME=/home/${USERNAME}

echo "==> User Init"
useradd -d /home/${USERNAME} -m ${USERNAME} -s /bin/bash
echo "root:${PASSWORD}" | chpasswd
echo "${USERNAME}:${PASSWORD}" | chpasswd

if [ "${AUTHORIZED_KEYS}" != "**None**" ]; then
    echo "=> Found authorized keys"
    mkdir -p ${HOME}/.ssh
    chmod 700 ${HOME}/.ssh
    touch ${HOME}/.ssh/authorized_keys
    chmod 600 ${HOME}/.ssh/authorized_keys
    IFS=$'\n'
    arr=$(echo ${AUTHORIZED_KEYS} | tr "," "\n")
    for x in $arr
    do
        x=$(echo $x |sed -e 's/^ *//' -e 's/ *$//')
        cat ${HOME}/.ssh/authorized_keys | grep "$x" >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "=> Adding public key to ${HOME}/.ssh/authorized_keys: $x"
            echo "$x" >> ${HOME}/.ssh/authorized_keys
        fi
    done
fi

echo "========================================================================"
echo "You can now connect to this Ubuntu container via SSH using:"
echo ""
echo "    ssh ${USERNAME}@${HOST_IP} -p 22"
echo "and enter the ${USERNAME} password '$PASSWORD' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"

exec /usr/sbin/sshd -D
