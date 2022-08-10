#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}

netstat -altpn
# curl  -H 'Host:localhost' http://127.0.0.1:9221/json/version

curl  -H 'Host:localhost' http://127.0.0.1:9222/json/version

curl  -H 'Host:localhost' http://127.0.0.1:9222/json/new?http://www.yntv.cn/list.html?sectionid=31
curl  -H 'Host:localhost' http://127.0.0.1:9222/json/list

pwd
ls -lh .
npm install
node chromium-headless-yn_xwlb.js



