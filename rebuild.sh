#!/bin/bash
docker-compose down
sudo rm db mgr5 -rf 
docker-compose build
