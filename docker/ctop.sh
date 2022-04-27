#!/bin/bash

if [ $# -lt 1 ];then
    echo "docker machine 服务器名"
    echo "usage: $0 serverName"
    exit
fi

machineName=$1

# 如果你想看当前的容器运行状态
# docker exec -it ctop


eval $(docker-machine env $machineName)
docker run --rm -d \
  --name=ctop \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  quay.io/vektorlab/ctop:latest