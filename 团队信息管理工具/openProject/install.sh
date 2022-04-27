#!/bin/bash
set -e -v
echo "参考网址： https://www.openproject.org/docs/installation-and-operations/installation/docker/"

echo `pwd`
if [[ `uname` == 'Darwin' ]]; then
  echo "openProject 不支持 Mac OS"
  exit 255
fi


git clone https://github.com/opf/openproject-deploy --depth=1 --branch=stable/12 openproject
cd openproject/compose
docker-compose pull

