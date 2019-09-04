
# 先打开远程端口  2376  docker machine engine 要用到这个端口

# 打开 8988  docker-compose.yml 文件用到
# 打开 8988/udp  docker-compose.yml 文件用到

# (在服务器上运行) 由于 aws 之类的服务器 不能用 root 用户登录 需要给当前用户赋予 超级权限 wheel 组 具有超级权限
    sudo usermod -aG wheel `whoami`

# 先在 .bash_profile 中配置各个变量
    export ss_ip=13..82
    export ss_key=~/.ssh/id_rsa
    export ss_vm=seoulvm
    export ss_password=3JA-VeT     
# (在本地运行) 接着需要创建 docker-machine,
    docker-machine create --driver generic --generic-ip-address=$ss_ip --generic-ssh-key $ss_key --generic-ssh-user $ss_user $ss_vm

# (在本地运行) 然后运行 run.sh 脚本

    ./run.sh $ss_vm $ss_password


