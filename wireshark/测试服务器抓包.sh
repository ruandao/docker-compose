#!/usr/bin/env bash

# 8811 竞技场
# 83 经典场
ssh test tcpdump -U -s0 -n -w - -i eth0  port 8811 or port 83  | wireshark -k -i -
