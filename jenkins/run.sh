#!/usr/bin/env bash



#eval $(docker-machine env sm-desktop)

docker stack deploy -c docker-compose.yml jenkins
