#!/bin/bash
docker exec -it `docker ps | grep docker_billmgr_billmgr | awk '{print $1}'` bash
