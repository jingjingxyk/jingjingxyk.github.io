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


pwd
ls -lh .
npm install
node chromium-headless-yn_xwlb.js



