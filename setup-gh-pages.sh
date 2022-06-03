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

sudo apt install -y iputils-ping net-tools dnsutils iproute2 procps iputils-ping lsof git python3 python3-pip

git clone https://github.com/jingjingxyk/Thanks-Mirror.git --depth=1 --progress

cd Thanks-Mirror
bash build-local-doc.sh

cd ${__DIR__}
cp Thanks-Mirror/index.html ./Thanks-Mirror.html


npm install
mkdir -p gh-pages/yn_xwlb_content
mkdir -p gh-pages/gh-pages

cp -f index.html gh-pages/
cp -f CNAME gh-pages
cp -f ./Thanks-Mirror.html gh-pages

npm run build
git branch -a

