#!/bin/bash

HTTP_PORT=8090
NODE_PORT=30000
NODE_PASS=changeme

# update and install docker
sudo apt update; \
sudo apt install docker.io

# update the ufw rules, if exist
sudo ufw allow $HTTP_PORT comment "Tera Web Port"
sudo ufw allow $NODE_PORT comment "Tera Node Port"

# create TERA dir and DATA dir
cd ~
mkdir TERA
cd TERA
mkdir DATA
sudo chmod -R 777 DATA

sudo docker run -d --restart always -p $HTTP_PORT:$HTTP_PORT -p $NODE_PORT:30000 \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=$NODE_PASS \
   -e PORT=$HTTP_PORT \
   --name tera nunoferro/tera:latest

sudo docker logs -f tera
