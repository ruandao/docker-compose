#!/bin/bash

# 更新到最新 yum 包
yum update -y

# 卸载旧版本（如果安装过旧版本的话）
yum remove docker docker-common docker-selinux docker-engine docer-io

# 安装需要的软件包
# yum-util 提供 yum-config-manager 功能， 另外两个是 devicemapper 驱动依赖
yum install -y yum-utils device-mapper-persistent-data lvm2

# 设置 yum 源
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 查看所有仓库中所有 docker 版本，并选择特定版本安装
yum list docker-ce --showduplicates | sort -r