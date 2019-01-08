#!/usr/bin/env bash

. ~/.bash_profile #
docker stack stop tars
docker stack rm tars
echo "sleep 5 seconds"
sleep 5
docker stack deploy -c docker-compose.yml tars