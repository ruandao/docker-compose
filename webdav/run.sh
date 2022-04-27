#!/bin/bash

if [ $# -lt 1 ];then
    echo "docker machine 服务器名"
    echo "usage: $0 serverName"
    exit
fi

machineName=$1

eval $(docker-machine env $machineName)
docker swarm init
docker stack deploy -c docker-compose.yml ominifocus
