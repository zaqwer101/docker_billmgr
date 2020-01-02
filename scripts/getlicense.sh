#!/bin/bash

if [ ! $KEY ]; then
    echo "Ключ не установлен, необходимо задать его в переменной KEY"
    exit 1
fi
echo $KEY
docker exec docker_billmgr_billmgr-service_1 /usr/local/mgr5/sbin/licctl fetch billmgr $KEY
