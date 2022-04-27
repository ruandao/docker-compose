#!/bin/bash

#https://hub.docker.com/r/odarriba/timemachine/
docker run \
        -h timemachine \
        --name timemachine \
        --restart=unless-stopped -d \
        -v /home/yan/timemachine/volume:/timemachine \
        -it -p 548:548 -p 636:636 \
        --ulimit nofile=65536:65536 odarriba/timemachine

# 添加账号
# docker exec timemachine add-account USERNAME PASSWORD VOL_NAME VOL_ROOT [VOL_SIZE_MB]
