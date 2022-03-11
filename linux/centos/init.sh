#!/bin/sh
# 1 关闭防火墙
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
systemctl stop firewalld.service && systemctl disable firewalld.service
yum remove -y $(rpm -qa | grep docker)
# 1.1卸载旧版本Docker软件
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux  docker-engine-selinux docker-engine container*
rm -rf /etc/systemd/system/docker.service.d
rm -rf /var/lib/docker
rm -rf /var/run/docker
# 1.2:localtime
#ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#echo 'LANG="en_US.UTF-8"' >> /etc/profile;source /etc/profile
# -------开始---------
# 定义用户名
#NEW_USER=youht
# 添加用户(可选)
#sudo adduser $NEW_USER
# 为新用户设置密码
#sudo passwd $NEW_USER
# 为新用户添加sudo权限
#sudo echo "$NEW_USER ALL=(ALL) ALL" >> /etc/sudoers
# 定义安装版本
export docker_version=18.06.3
# step 1: 安装必要的一些系统工具
sudo yum update -y;
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 bash-completion;
# Step 2: 添加软件源信息
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo;
#sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
#yum-config-manager --enable docker-ce-nightly
#yum-config-manager --disable docker-ce-nightly
#yum makecache fast
# Step 3: 更新并安装 Docker-CE
sudo yum makecache all;
version=$(yum list docker-ce.x86_64 --showduplicates | sort -r|grep ${docker_version}|awk '{print $2}');
sudo yum -y install --setopt=obsoletes=0 docker-ce-${version} docker-ce-selinux-${version};
# 如果已经安装高版本Docker,可进行降级安装(可选)
#yum downgrade --setopt=obsoletes=0 -y docker-ce-${version} docker-ce-selinux-${version};
# 把当前用户加入docker组
#sudo usermod -aG docker $NEW_USER;
# 设置开机启动
sudo systemctl start docker;
sudo systemctl enable docker.service;