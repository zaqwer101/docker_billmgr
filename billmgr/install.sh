#!/bin/bash
yum makecache 
yum install wget -y
wget http://cdn.ispsystem.com/install.sh -O /root/install.sh
sh /root/install.sh billmanager-corporate --release beta --noinstall
echo $TESTENV