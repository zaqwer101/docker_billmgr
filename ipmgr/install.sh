#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "Начинаем.."
yum install -y psmisc wget

if [ ! -f /usr/local/mgr5/.ipmgr_installed ]; then
    echo "Панель IPmanager не установлена"
    wget http://cdn.ispsystem.com/install.sh -O /root/install.sh
    sh /root/install.sh --release beta --noinstall
    yum install ipmanager ipmanager-common ipmanager-bind -y
    touch /usr/local/mgr5/.ipmgr_installed
    sleep 2
else
    echo "Панель уже установлена"
fi
echo $IPMGR_PASSWORD
/usr/local/mgr5/sbin/mgrctl -m ipmgr user.edit name=bill passwd=$IPMGR_PASSWORD confirm=$IPMGR_PASSWORD sok=ok


for ((;;))
do
    sleep 10
done