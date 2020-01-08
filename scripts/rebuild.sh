#!/bin/bash
docker-compose down
sudo rm ../mgrdata/* -rf
docker-compose build
docker-compose up -d
