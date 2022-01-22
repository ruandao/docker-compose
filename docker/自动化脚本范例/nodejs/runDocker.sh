#!/bin/sh
set -e  # exit on error


if [ -n "$(git status --porcelain)" ]; then
  echo "文件被修改，请先清空变化";
  exit 1;
else
  echo "no changes";
fi


dtimeStamp=`git show -s --format=%at`
if [[ `uname` == 'Darwin' ]]; then
  echo "Mac OS"
  d=`date -r${dtimeStamp} "+%Y-%m-%d_%H_%M_%S"`
fi

if [[ `uname` == 'Linux' ]]; then
  d=`date -d @${dtimeStamp} "+%Y-%m-%d_%H_%M_%S"`
    echo "Linux"
fi

hash=`git rev-parse --short HEAD`
imgName=qjz:${d}_${hash}
echo "容器名为: $imgName"

# 生成镜像
docker build -t $imgName .

# 清理旧的容器服务
docker rm -f qjz
# 运行容器
docker run -d --name qjz --env-file ../env/qjz -p 7002:7002 -p 7022:7022  -v `pwd`/logs:/root/logs $imgName

