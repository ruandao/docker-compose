#!/bin/bash
#https://pkg.jenkins.io/redhat-stable/


sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y epel-release # repository that provides 'daemonize'
#yum install -y java-8-openjdk-devel
yum install -y jenkins

