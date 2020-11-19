#!/bin/sh
# create networks
docker network create proxy
docker network create tick_backend
docker network create ldap

# deploy all stacks
cd rp
docker-compose up -d
cd ../admin
docker-compose up -d
cd ../tick
docker-compose up -d
cd ../ldap
docker-compose up -d
cd ../nextcloud
docker-compose up -d
cd ../mailcow-dockerized
docker-compose up -d
