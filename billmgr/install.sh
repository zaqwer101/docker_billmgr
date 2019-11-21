#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo $MYSQL_SERVER_IP
yum install wget psmisc -y 
wget http://cdn.ispsystem.com/install.sh -O /root/install.sh 
sh /root/install.sh billmanager-corporate --release beta --noinstall 
mkdir -p /usr/local/mgr5/etc/billmgr.conf.d 

echo -e "DBHost $MYSQL_SERVER_IP \n\
DBUser billmgr \n\
DBPassword 172.30.20.101 \n\
DBName billmgr" > /usr/local/mgr5/etc/billmgr.conf.d/db.conf

CONFIG=$(cat /usr/local/mgr5/etc/billmgr.conf | grep -v "DB")

echo -e "$CONFIG \n\
DBHost 172.30.20.101 \n\
DBUser billmgr \n\
DBPassword $MYSQL_PASSWORD \n\
DBName billmgr" > /usr/local/mgr5/etc/billmgr.conf

yum install -y coremanager
killall -9 ihttpd
echo -e " \
    listen { \n \
        ip * \n \
        port 1500 \n \
        redirect }" > /usr/local/mgr5/etc/ihttpd.conf
yum install -y billmanager-corporate
cat /usr/local/mgr5/etc/ihttpd.conf
/usr/local/mgr5/sbin/mgrctl -m billmgr session.newkey key=sdkfmnsdbf6dt8s7yf98udsiofjsdh
killall -9 ihttpd 
/usr/local/mgr5/sbin/ihttpd -d 