#!/bin/sh

# 拉取最新代码
#git pull origin master
set -exu

TIME=`date "+%Y%m%d%H%M"`
IMAGE_NAME="wenba100xie/gitbook-cli:gitbook-3.2.3-20210804"
uid=$(id -u)
gid=$(id -g)
__DIR__=$(cd "$(dirname "$0")";pwd)
shell="chown -R ${uid}:${gid} /workspace"

docker run --rm -v ${__DIR__}:/workspace --workdir=/workspace $IMAGE_NAME /bin/sh -c "npm install -d && npm run build && sh gitbook-build.sh && ${shell}"
