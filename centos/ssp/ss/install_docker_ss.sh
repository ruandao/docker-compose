#!/bin/sh -ex

MYPASSWORD=$1
if [ $# -lt 1 ];then
    echo "please enter ss password:"
    exit
fi

if [ ! -f ss/docker-compose.yml ];then
    echo "not found ss/docker-compose.yml"
    exit
fi

sed -i "s/mypassword-dont-modify/$MYPASSWORD/g" ss/docker-compose.yml
cat ss/docker-compose.yml
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker.service
sudo systemctl start docker.service

# install docker compose 
sudo yum install -y epel-release
sudo yum install -y python-pip
sudo pip install docker-compose
sudo yum upgrade -y python*
docker-compose version

sleep 3
sudo chmod u+s /usr/bin/docker

docker swarm init
docker stack deploy -c ss/docker-compose.yml ss
