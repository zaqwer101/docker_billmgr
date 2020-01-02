#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo $MYSQL_SERVER_IP 
echo "Начинаем.."
echo $KEY
echo `ls /`
if [ ! -f /usr/local/mgr5/.billmgr_installed ]; then
    echo "Панель BILLmanager не установлена"
    if [ $KEY ]; then
        echo "Ключ лицензии не установлен!"
        return 1
    fi

    mkdir -p /usr/local/mgr5/etc/billmgr.conf.d
    echo -e "DBHost 172.30.20.101 \n\
DBUser billmgr \n\
DBPassword 944sn3O8d92s \n\
DBName billmgr" > /usr/local/mgr5/etc/billmgr.conf.d/db.conf

    echo -e "DBHost 172.30.20.101\n\
DBUser billmgr\n\
DBPassword 944sn3O8d92s\n\
DBName billmgr\n\n\
Option EULA\n" > /usr/local/mgr5/etc/billmgr.conf
    yum install -y coremanager
    yum install -y billmanager-corporate
    yum install -y billmanager-plugin-pmwire
    cp -rf /billmanager.docker.crt /usr/local/mgr5/etc/manager.crt
    cp -rf /device.key /usr/local/mgr5/etc/manager.key
    cp -rf /ihttpd.conf /usr/local/mgr5/etc/ihttpd.conf
    killall -9 ihttpd
    /usr/local/mgr5/sbin/licctl fetch billmgr $KEY
    sleep 60
    echo "Начинаем конфигурирование..."
    sh /billmanager_init.sh
    echo "Панель установлена"
    touch /usr/local/mgr5/.billmgr_installed
else
    echo "Панель уже установлена, запускаем"
fi

cat /usr/local/mgr5/etc/ihttpd.conf
echo -e "\n\n---------------------------\n\n"
killall -9 ihttpd 
/usr/local/mgr5/sbin/mgrctl -m billmgr employee.edit elid=1 password=$BILLMGR_PASSWORD confirm=$BILLMGR_PASSWORD sok=ok
/usr/local/mgr5/sbin/ihttpd
echo "Done!"
for ((;;))
do
    sleep 10
done