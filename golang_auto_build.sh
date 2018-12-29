#!/usr/bin/env bash


# 以下， 可以把某个变量动态传入到二进制文件中，作为一个字符串
# 譬如把编译版本，编译时间，传入到二进制文件中
    minversion=xxx
    go build -ldflags "-X main.minversion=${minversion} -X main/zookeeper.minversion=${minversion}  -X main/kafka.buildV=$tagName"  -o $target
