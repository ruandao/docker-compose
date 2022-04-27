#!/bin/bash

sudo modprobe af_key

docker run \
    --name ipsec-vpn-server \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v "$(pwd)/vpn.env:/opt/src/vpn.env:ro" \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server
