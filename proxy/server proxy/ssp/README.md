
# 先打开远程端口  2376  docker machine engine 要用到这个端口

# 打开 8988  docker-compose.yml 文件用到
# 打开 8988/udp  docker-compose.yml 文件用到

# 由于 aws 之类的服务器 不能用 root 用户登录 需要给当前用户赋予 超级权限 wheel 组 具有超级权限

    sudo usermod -aG wheel `whoami`

# 接着需要创建 docker-machine 

    docker-machine create --driver generic \
    --generic-ip-address=$serverIp \
    --generic-ssh-key ~/.ssh/$id_rsa \
    --generic-ssh-user centos \
    $serverName

# 然后运行 run.sh 脚本

    ./run.sh $serverName $my_ss_password


