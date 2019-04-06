#!/bin/sh

machineName=xxxx

eval $(docker-machine env $machineName)
docker stack deploy -c docker-compose.yml rsshub