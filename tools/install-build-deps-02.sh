#!/bin/bash

set -exu

__DIR__=$(cd "$(dirname "$0")";pwd)
cd ${__DIR__}

mkdir -p dist
cd dist

cat /etc/os-release
echo $(id -u)
echo $(id -g)



if [ ! -f node-v16.16.0-linux-x64.tar ] ;then
  wget https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.xz
  xz -d node-v16.16.0-linux-x64.tar.xz
  tar -xvf node-v16.16.0-linux-x64.tar
fi



if [ ! -f go1.19.linux-amd64.tar.gz ] ;then
  #wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
  # china mirror
   wget https://golang.google.cn/dl/go1.19.linux-amd64.tar.gz
   tar -zxvf go1.19.linux-amd64.tar.gz
fi



mkdir -p ${__DIR__}/dist/GOPATH


# GOPROXY=https://mirrors.aliyun.com/goproxy/

export GOPATH=${__DIR__}/dist/GOPATH
export GO111MODULE=on
export PATH=${__DIR__}/dist/node-v16.16.0-linux-x64/bin/:${__DIR__}/dist/go/bin/:$PATH
