#!/bin/bash
set -e -v
echo "参考网址： https://www.openproject.org/docs/installation-and-operations/installation/docker/"

echo `pwd`

cd openproject/compose
docker-compose down

echo "http://localhost:8080"
echo "默认账号密码是 admin/admin"
echo "关闭: docker-compose down"