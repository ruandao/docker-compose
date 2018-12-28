#!/usr/bin/env bash

git diff --quiet --exit-code
if [ $? -ne 0 ];then
    echo "有内容在工作区"
    exit 1
fi
git diff --quiet --cached --exit-code
if [ $? -ne 0 ];then
    echo "有内容在暂存区"
    exit 2
fi


# now 变量从上层传进来，如果未设置，说明不是开发版本，不是释放版本
now=$1
if [ -z $now ];then
    echo "develop version"
    now=`date +"dev_%y-%m-%d_%H_%M_%S"`

else
    echo "release version"
fi

./xxxx $now
# 如果 $? 不是 0 说明 xxx 脚本调用失败
if [ $? -ne 0 ];then
    echo "调用脚本 xxx 失败"
    exit 1
fi

buildV=$now
tagName="build_$buildV"
git tag $tagName
git push