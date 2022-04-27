#!/bin/bash

if [ $# -lt 2 ];then
    echo "usage: $0 serverName my_ss_password"
    exit
fi

export machineName=$1
export my_ss_password=$2

eval $(docker-machine env $machineName)
docker swarm init 
docker stack deploy -c docker-compose.yml proxy
