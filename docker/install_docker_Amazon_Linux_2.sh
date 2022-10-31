#!/bin/bash
# https://www.cyberciti.biz/faq/how-to-install-docker-on-amazon-linux-2/


sudo yum install docker

wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

sudo systemctl enable docker.service

sudo systemctl start docker.service
