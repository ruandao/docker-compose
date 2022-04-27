#!/bin/bash

mkdir -p /Users/cpu/dev/docker/sonarqube/sonarqube/conf
mkdir -p /Users/cpu/dev/docker/sonarqube/sonarqube/data
mkdir -p /Users/cpu/dev/docker/sonarqube/sonarqube/extensions
mkdir -p /Users/cpu/dev/docker/sonarqube/sonarqube/plugins
mkdir -p /Users/cpu/dev/docker/sonarqube/postgresql/db
mkdir -p /Users/cpu/dev/docker/sonarqube/postgresql/data
# mkdir -p 

docker stack deploy --platform=linux/amd64 -c docker-compose-mac.yml codeReview
# docker stack rm codeReview