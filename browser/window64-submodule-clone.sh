#!/bin/bash
# 好吧...这个其实应该要用.bat 脚本的,奈何我不知道该怎么写 .bat 脚本...
cd `git rev-parse --show-toplevel`
git submodule init browser/chrome-window64
git submodule update
