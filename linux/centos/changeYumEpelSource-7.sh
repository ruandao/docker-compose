#!/bin/bash

yum install -y wget
cd /etc/yum.repos.d/
mkdir repo_bak
mv *.repo repo_bak/
wget http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache
yum install -y epel-release
wget -O /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum clean all
yum makecache
yum repolist enabled