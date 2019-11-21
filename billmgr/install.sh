#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo $MYSQL_SERVER_IP 
echo "Начинаем.."
if [ ! -f /root/.installed ]; then
    echo "Панель не установлена"
    mkdir -p /usr/local/mgr5/etc/billmgr.conf.d
    echo -e "DBHost 172.30.20.101 \n\
DBUser billmgr \n\
DBPassword 944sn3O8d92s \n\
DBName billmgr" > /usr/local/mgr5/etc/billmgr.conf.d/db.conf

#   CONFIG=$(cat /usr/local/mgr5/etc/billmgr.conf | grep -v "DB")

    echo -e "DBHost 172.30.20.101\n\
DBUser billmgr\n\
DBPassword 944sn3O8d92s\n\
DBName billmgr\n" > /usr/local/mgr5/etc/billmgr.conf
    yum install -y coremanager
    killall -9 ihttpd
    echo -e " \
listen { \n \
ip * \n \
port 1500 \n \
redirect }" > /usr/local/mgr5/etc/ihttpd.conf
    yum install -y billmanager-corporate
    touch /root/.installed
else
    echo "Панель уже установлена"
fi

cat /usr/local/mgr5/etc/ihttpd.conf
/usr/local/mgr5/sbin/mgrctl -m billmgr session.newkey key=sdkfmnsdbf6dt8s7yf98udsiofjsdh
/usr/local/mgr5/sbin/mgrctl -m billmgr employee.edit elid=1 password=$BILLMGR_PASSWORD confirm=$BILLMGR_PASSWORD
killall -9 ihttpd 
/usr/local/mgr5/sbin/ihttpd -d 