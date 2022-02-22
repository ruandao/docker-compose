#!/bin/sh
set -e  # exit on error
businessName=XXX

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

branch=`git rev-parse --abbrev-ref HEAD`
hash=`git rev-parse --short HEAD`
imgName=${businessName}:${branch}_${d}_${hash}
echo "容器名为: $imgName"

# 生成镜像
docker build -t $imgName .

# 清理旧的容器服务
docker rm -f ${businessName}
# 运行容器


docker run -dit --name ${businessName} \
                --hostname ${businessName} \
                --env-file ../env/${businessName} \
                -v /data/dockerBuilder/${businessName}/logs:/root/logs \
                -p 8088:3000 \
                $imgName

# 支持自动推送部署的时间截到远端
dt=`date +test/_%Y_%m_%d_%H_%M_%S`
git tag ${dt}
git push origin ${dt}