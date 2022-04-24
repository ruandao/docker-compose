#!/bin/sh
set -e

# 确保当前区域没有未提交的代码
if [ -n "$(git status --porcelain)" ]; then
  echo "文件被修改，请先清空变化";
  exit 1;
else
  echo "no changes";
fi
