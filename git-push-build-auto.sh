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

buildV=$(date "+%Y-%m-%d_%H_%M_%S")
tagName="build_$buildV"
git tag $tagName
git push