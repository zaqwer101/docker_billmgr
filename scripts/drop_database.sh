#!/bin/bash

docker exec docker_billmgr_mysql-service_1 mysql -e "drop database billmgr" -p`docker exec -it docker_billmgr_billmgr-service_1 cat /usr/local/mgr5/etc/billmgr.conf.d/db.conf | grep DBPassword | awk '{print $2}'`
docker exec -it docker_billmgr_billmgr-service_1 killall -9 core
docker exec docker_billmgr_billmgr-service_1 /usr/local/mgr5/sbin/mgrctl -m billmgr -R
sleep 30
echo "Начинаем начальные настройки..."
docker exec docker_billmgr_billmgr-service_1 bash /billmanager_init.sh
