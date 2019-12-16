#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo $MYSQL_SERVER_IP 
echo "Начинаем.."
echo `ls /`
if [ ! -f /usr/local/mgr5/.billmgr_installed ]; then
    echo "Панель BILLmanager не установлена"
    mkdir -p /usr/local/mgr5/etc/billmgr.conf.d
    echo -e "DBHost 172.30.20.101 \n\
DBUser billmgr \n\
DBPassword 944sn3O8d92s \n\
DBName billmgr" > /usr/local/mgr5/etc/billmgr.conf.d/db.conf

    echo -e "DBHost 172.30.20.101\n\
DBUser billmgr\n\
DBPassword 944sn3O8d92s\n\
DBName billmgr\n" > /usr/local/mgr5/etc/billmgr.conf
    yum install -y coremanager
    yum install -y billmanager-corporate

    cp -rf /billmanager.crt /usr/local/mgr5/etc/billmanager.crt
    cp -rf /billmanager.key /usr/local/mgr5/etc/billmanager.key
    cp -rf /ihttpd.conf /usr/local/mgr5/etc/ihttpd.conf
    killall -9 ihttpd
    touch /usr/local/mgr5/.billmgr_installed
else
    echo "Панель уже установлена"
fi

cat /usr/local/mgr5/etc/ihttpd.conf
echo -e "\n\n---------------------------\n\n"
killall -9 ihttpd 
# sleep 10
# /usr/local/mgr5/sbin/mgrctl -m billmgr employee.edit elid=1 password=$BILLMGR_PASSWORD confirm=$BILLMGR_PASSWORD sok=ok
/usr/local/mgr5/sbin/ihttpd 
for ((;;))
do
    sleep 10
done