#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}


docker run --rm --name chromium  -d -p 9221:9221 -p 9222:9222 wenba100xie/chromium:debian-11-20220404T0526Z bash /workspace/startup.sh

sleep 5
docker ps
container_id=$(docker ps | sed -n '2p' | awk '{print $1}')
docker logs $container_id
docker exec -i $container_id ps -ef
docker exec -i $container_id ls -lh  /workspace/
#docker exec -i $container_id /usr/local/bin/supervisord -c /etc/supervisord.conf

#docker exec -i $container_id /usr/local/bin/supervisorctl update
docker exec -i $container_id /usr/local/bin/supervisorctl status




