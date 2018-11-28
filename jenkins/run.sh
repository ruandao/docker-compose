#!/usr/bin/env bash

. ~/.bashrc

eval $(docker-machine env censusvm)

docker stack deploy -c docker-compose.yml jenkins