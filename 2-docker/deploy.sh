#!/usr/bin/env bash

scp -r ./docker-compose.yml root@
ssh root@ <<EOF
docker login -username kramihm@gmail.com --password  registry.digitalocean.com
sudo docker-compose pull
sudo docker-compose up -d
EOF
