#!/bin/sh

git config --global http.proxy 'socks://127.0.0.1:2234'
git config --global https.proxy 'socks://127.0.0.1:2234'
docker swarm init
docker stack deploy -c docker-compose.yml www
