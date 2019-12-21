#!/bin/sh

# 拉取最新代码
#git pull origin master

TIME=`date "+%Y%m%d%H%M"`
IMAGE_NAME="jingjingxyk/github-io:${TIME}"

docker build -t ${IMAGE_NAME} -f ./Dockerfile .

