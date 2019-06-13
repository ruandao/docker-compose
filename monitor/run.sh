#!/bin/bash

eval $(docker-machine env censusvm)
# 8890: zipkin
# 3000: grafana
# 9121: redis-exporter
# 9090: prometheus
. ~/.bash_profile # for what shell variable like ${redis_host}
docker stack deploy -c docker-compose.yml monitor

# 8880: sonarQube
#docker stack deploy -c codeReview/docker-compose.yml codeReview