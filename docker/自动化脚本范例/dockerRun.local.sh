#!/bin/bash
set -e  # exit on error
businessName=XXX

# 本地运行的是最新的，可能包括未提交的
# if [ -n "$(git status --porcelain)" ]; then
#   echo "文件被修改，请先清空变化";
#   exit 1;
# else
#   echo "no changes";
# fi


dtimeStamp=`git show -s --format=%at`
if [[ `uname` == 'Darwin' ]]; then
  echo "Mac OS"
  # d=`date -r${dtimeStamp} "+%Y-%m-%d_%H_%M_%S"`
  d=`date "+%Y-%m-%d_%H_%M_%S"`
fi

if [[ `uname` == 'Linux' ]]; then
  # d=`date -d @${dtimeStamp} "+%Y-%m-%d_%H_%M_%S"`
  d=`date "+%Y-%m-%d_%H_%M_%S"`
  echo "Linux"
fi
branch=`git rev-parse --abbrev-ref HEAD`
hash=`git rev-parse --short HEAD`
imgName=${businessName}:${branch}_${d}_${hash}
echo "容器名为: $imgName"

# 生成镜像
docker build -t $imgName .


# 清理旧的容器服务
set +e # 下面这行失败是可以接受的
docker rm -f ${businessName}
set -e
# 运行容器
echo "如果你想手动查找问题，可以试试以下命令来运行容器"
echo "docker run -it --rm --name ${businessName} --env-file ../env/${businessName} -p 8088:3000  -v `pwd`/logs:/root/logs $imgName /bin/sh "
docker run --rm --name ${businessName} \
            --env-file ../env/${businessName} \
            --add-host=host.docker.internal:host-gateway \
            --env aa=bb \
            -p 8088:3000 \
            -v `pwd`/logs:/root/logs \
            $imgName

