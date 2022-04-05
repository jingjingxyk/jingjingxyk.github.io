#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}


cat /etc/os-release
echo $(id -u)
echo $(id -g)

sudo apt install -y iputils-ping net-tools dnsutils iproute2 procps iputils-ping lsof


npm install
mkdir -p gh-pages/yn_xwlb_content
mkdir -p gh-pages/gh-pages
cp -f index.html gh-pages/
cp -f CNAME gh-pages
npm run build
git branch -a

