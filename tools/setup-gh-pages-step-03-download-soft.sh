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

export http_proxy=${1:+'http://127.0.0.1:8015'}
export https_proxy=${1:+'http://127.0.0.1:8015'}

# download socat
test -d socat-1.7.4.4.tar.gz || curl -Lo socat-1.7.4.4.tar.gz  http://www.dest-unreach.org/socat/download/socat-1.7.4.4.tar.gz


# 源码
cp -f socat-1.7.4.4.tar.gz ${__ROOT__}/gh-pages/cloud-soft/socat-1.7.4.4.tar.gz


cd ${__DIR__}



ls ${__ROOT__}/gh-pages/chromium-extension/ > ${__ROOT__}/gh-pages/chromium-extension/index.txt
