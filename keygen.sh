#!/bin/bash
KEY=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo $KEY
docker exec docker_billmgr_billmgr-service_1 /usr/local/mgr5/sbin/mgrctl -m billmgr session.newkey key=$KEY
URL="https://127.0.0.1:1500/billmgr?func=auth&key=$KEY"
echo $URL
echo "$URL" | xclip -i

