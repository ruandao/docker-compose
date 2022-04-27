#!/bin/bash

# 如果 package.json 发生变化，那么执行 npm install
if ! git diff HEAD^ HEAD --exit-code -- ./package.json; then
    cnpm install
fi