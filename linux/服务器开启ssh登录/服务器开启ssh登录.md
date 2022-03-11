1.查询是否安装SSH.

    rpm -pa |grep ssh
2.如果没有安装rmp:

    sudo apt-get install rpm          #ubuntu,debian
    yum -y instal rpm                 #centos,redhat
3.安装SSH

    sudo apt-get install ssh
    or
    yum -y install openssh
  
4.启动服务:

    service sshd start
    or
    /bin/systemctl restart sshd.service
    or
    /etc/init.d/sshd start
5.配置端口:

    vim /etc/ssh/sshd_config
6.将port 前面的#删除,也可以更改其它端口.
![alt 图片六](./6.%E5%B0%86port%20%E5%89%8D%E9%9D%A2%E7%9A%84%23%E5%88%A0%E9%99%A4%2C%E4%B9%9F%E5%8F%AF%E4%BB%A5%E6%9B%B4%E6%94%B9%E5%85%B6%E5%AE%83%E7%AB%AF%E5%8F%A3.png)


7.允许root用户远程登录.

![alt 7](./7.%E5%85%81%E8%AE%B8root%E7%94%A8%E6%88%B7%E8%BF%9C%E7%A8%8B%E7%99%BB%E5%BD%95.png)


8.查看服务是否启动:

ps -e | grep ssh

![](./8.%E6%9F%A5%E7%9C%8B%E6%9C%8D%E5%8A%A1%E6%98%AF%E5%90%A6%E5%90%AF%E5%8A%A8.png)

 
