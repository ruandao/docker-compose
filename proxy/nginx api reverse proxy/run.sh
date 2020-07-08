#!/bin/sh

docker swarm init
docker stack deploy -c docker-compose.yml proxy
