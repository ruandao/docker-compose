https://www.cnblogs.com/linanjie/p/13912004.html

一、部署规划
服务器IP	192.168.113.48
端口	3306
安装目录	/home/work/docker-mysql-5.7
数据映射目录	/home/work/docker-mysql-5.7/data
配置文件	/home/work/docker-mysql-5.7/config/my.cnf
使用3306端口，安装前请确保宿主机3306端口是否已被占用。Mysql的默认字符集为latin1，根据配置文件将字符集集修改为utf8mb4，该字符集支持emoji特殊字符。

二、安装Mysql5.7
在安装目录下新建并按照规划编辑docker-compose.yml文件，编辑完后保存退出

vim docker-compose.yml
version: '3'
services:
  mysql:
    image: mysql:5.7
    container_name: mysql-5.7
    #使用该参数，container内的root拥有真正的root权限，否则，container内的root只是外部的一个普通用户权限
    #设置为true，不然数据卷可能挂载不了，启动不起
    privileged: true
    restart: always
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_USER: root
      MYSQL_PASS: root
      TZ: Asia/Shanghai
    command:
      --wait_timeout=31536000
      --interactive_timeout=31536000
      --max_connections=1000
      --default-authentication-plugin=mysql_native_password
    volumes:
      #映射mysql的数据目录到宿主机，保存数据
      - "/home/work/docker-mysql-5.7/data:/var/lib/mysql"
      #根据宿主机下的配置文件创建容器
      - "/home/work/docker-mysql-5.7/config/my.cnf:/etc/mysql/my.cnf"
根据需要root用户密码可自行决定；连接时间、最大连接数可根据需要进行修改；

--default-authentication-plugin=mysql_native_password主要解决远程访问问题。若MySQL为8.0版本，请修改为--default-authentication-plugin=caching_sha2_password

在安装目录下创建config目录，并编写my.cnf配置文件

[client]
# 客户端来源数据的默认字符集
default-character-set=utf8mb4

[mysqld]
# 服务端默认字符集
character-set-server=utf8mb4
# 连接层默认字符集
collation-server=utf8mb4_unicode_ci

[mysql]
# 数据库默认字符集
default-character-set=utf8mb4
在安装目录下执行相关命令，启动容器

docker-compose up -d
查看并进入容器当中，登录mysql，查看字符集是否修改：

[root@node03 docker-mysql-5.7]# docker-compose ps
  Name                 Command               State                 Ports              
--------------------------------------------------------------------------------------
mysql-5.7   docker-entrypoint.sh --wai ...   Up      0.0.0.0:3306->3306/tcp, 33060/tcp
[root@node03 docker-mysql-5.7]# docker-compose exec mysql bash
root@72f9ad3a4f36:/# mysql -uroot -proot
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 35
Server version: 5.7.31 MySQL Community Server (GPL)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show variables like '%character%';
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8mb4                    |
| character_set_connection | utf8mb4                    |
| character_set_database   | utf8mb4                    |
| character_set_filesystem | binary                     |
| character_set_results    | utf8mb4                    |
| character_set_server     | utf8mb4                    |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
8 rows in set (0.01 sec)

mysql> 