#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
yum install wget psmisc -y 
wget http://cdn.ispsystem.com/install.sh -O /root/install.sh 
sh /root/install.sh billmanager-corporate --release beta --noinstall 
mkdir -p /usr/local/mgr5/etc/billmgr.conf.d 
echo -e " \
    DBHost mysql-service \n \
    DBUser billmgr \n \
    DBPassword $MYSQL_PASSWORD \n \
    DBName billmgr" > /usr/local/mgr5/etc/billmgr.conf.d/db.conf

CONFIG=$(cat /usr/local/mgr5/etc/billmgr.conf | grep -v "DB")

echo -e " \
    $CONFIG \n \
    DBHost mysql-service \n \
    DBUser billmgr \n \
    DBPassword $MYSQL_PASSWORD \n \
    DBName billmgr" > /usr/local/mgr5/etc/billmgr.conf

echo -e " \
    listen { \n \
        ip * \n \
        redirect \n \
}" > /usr/local/mgr5/etc/ihttpd.conf

yum install -y coremanager
killall -9 ihttpd 
yum install -y billmanager-corporate
/usr/local/mgr5/sbin/mgrctl -m billmgr session.newkey key=sdkfmnsdbf6dt8s7yf98udsiofjsdh
/usr/local/mgr5/sbin/ihttpd -d 