#!/usr/bin/env bash

eval $(docker-machine env 5yvm)

docker stack deploy -c docker-compose.yml codeReview