#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2021-10-19 14:13:26
 # @LastEditTime: 2021-12-06 23:17:34
 # @LastEditors: Cloudflying
 # @Description:
 # @FilePath: /dockenv/images/boxs/xfce-arch/conf/entrypoint.sh
###
HOST_IP=$(hostname -i)
# echo '==> start vncserver and noVNC webclient && dbus'
# sudo /etc/init.d/dbus start > /dev/null

if [[ "$VNC_PASSWD" != 'dockenv' ]]; then
    chmod 755 $VNC_PASSWD_PATH/passwd
    echo "$VNC_PASSWD" | vncpasswd -f > $VNC_PASSWD_PATH/passwd
    chmod 600 $VNC_PASSWD_PATH/passwd
fi

vncserver -kill $DISPLAY > /dev/null 2>&1 || rm -rfv /tmp/.X*-lock /tmp/.X11-unix
rm -fr /tmp/.X1*
# /bin/vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry ${VNC_RESOLUTION} > /tmp/vncserver.log 2>&1 &

# 重置 SSH 端口
if [[ "${SSH_PORT}" != 22 ]]; then
    sudo sed -i "s/^Port.*/Port ${SSH_PORT}/g" /etc/ssh/sshd_config
    # sudo service ssh restart > /dev/null
fi

sudo /usr/bin/supervisord -c /etc/supervisor.d/supervisord.ini -l /var/log/supervisord.log -j /var/run/supervisord.pid
# /usr/bin/vncserver :1

echo "======================================================================"
echo "You can now connect to this container via SSH using:                  "
echo "    ssh ${USER}@${HOST_IP} -p ${SSH_PORT}                             "
echo "Enter the ${USER} password => '${PASSWD}' when prompted               "
echo "Please remember to change the above password as soon as possible!     "
echo "================Boxs VNC Config======================================="
echo "  VNC   Port     : ${VNC_PORT}                                        "
echo "  noVNC Port     : ${NO_VNC_PORT}                                     "
echo "  VNC   Password : ${VNC_PASSWD}                                      "
echo "======================================================================"
echo "                Boxs is Running                                       "
echo "======================================================================"
# redirect log put desktop will not work
# /usr/bin/vncserver :1 2>1 >> /var/run/vncserver.log
/usr/bin/vncserver :1
tail -f /etc/os-release > /dev/null
