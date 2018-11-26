#!/usr/bin/env bash

eval $(docker-machine env censusvm)

docker stack deploy -c docker-compose.yml codeReview