#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
__ROOT__=$(cd ${__DIR__}/../;pwd)

mkdir -p ${__ROOT__}/gh-pages/cloud-soft

mkdir -p ${__DIR__}/dist

cd ${__DIR__}/dist

while [ $# -gt 0 ]; do
  case "$1" in
  --proxy)
    export http_proxy="$2"
    export https_proxy="$2"
    export no_proxy="127.0.0.1,localhost,ssl.google-analytics.com,127.0.0.0/8,10.0.0.0/8,100.64.0.0/10,172.16.0.0/12,192.168.0.0/16,198.18.0.0/15,169.254.0.0/16"
    export no_proxy="${no_proxy},.aliyuncs.com,.taobao.org,.aliyun.com,cdn.unrealengine.com"
    export no_proxy="${no_proxy},.tsinghua.edu.cn,.ustc.edu.cn,.npmmirror.com"
    ;;
  --*)
    ;;
  esac
  shift $(($# > 0 ? 1 : 0))
done

# download socat
test -d socat-1.7.4.4.tar.gz || curl -Lo socat-1.7.4.4.tar.gz  http://www.dest-unreach.org/socat/download/socat-1.7.4.4.tar.gz


# 源码
cp -f socat-1.7.4.4.tar.gz ${__ROOT__}/gh-pages/cloud-soft/socat-1.7.4.4.tar.gz


cd ${__DIR__}

