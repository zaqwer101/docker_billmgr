#!/bin/bash
docker-compose down
sudo rm mgrdata/db mgrdata/mgr5 -rf 
docker-compose build