#!/usr/bin/env bash

GOARCH=amd64 GOOS=linux go build .

if [ $? -ne 0 ]; then
    echo "failed build"
else
    echo "success build"
    docker build -t ruandao/longconnect:latest .
    docker push ruandao/longconnect:latest
    eval $(docker-machine env 5yvm)
    docker-machine ls
    docker stack deploy -c docker-compose.yml hotUpdateTest
fi