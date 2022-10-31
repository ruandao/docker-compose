#!/bin/sh
# https://hub.docker.com/r/easysoft/zentao


# 其中，容器名：启动的容器名字，可随意指定；
# 主机端口：主机端口为web访问端口；
# 主机禅道目录：必须指定，方便禅道代码、附件等数据的持久化，非升级情况需指定空目录；
# 主机mysql目录：必须指定，方便禅道数据持久化，非升级情况需指定空目录；
# 数据库密码： 容器内置mysql用户名为root,默认密码123456，如果不修改可以不指定该变量，如果想更改密码可以设置 MYSQL_ROOT_PASSWORD变量来更改密码；
docker run --name zentao -p 8988:80 \
        -v /root/ljy/zentao/zentao_code:/www/zentaopms \
        -v /root/ljy/zentao/zentao_mysql:/var/lib/mysql \
        -d easysoft/zentao:16.5


# 执行下面的命令，可以在本地访问远程主机的本地端口 具体搜索下"远程端口"
# ssh -f -N -L 8988:localhost:8988 5y        


# https://github.com/tonynii/zentao_docker-compose
git clone https://github.com/tonynii/zentao_docker-compose
cd zentao_docker-compose
docker-compose build
docker-compose up -d