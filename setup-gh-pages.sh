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

:<<EOF
git clone https://github.com/jingjingxyk/Thanks-Mirror.git --depth=1 --progress
git clone https://github.com/jingjingxyk/ReplaceGoogleCDN.git --depth=1 --progress

cd Thanks-Mirror
bash build-local-doc.sh

cd ${__DIR__}
cp Thanks-Mirror/index.html ./Thanks-Mirror.html

cd ReplaceGoogleCDN/extension/test/extension-v3-test
bash build-prepare-codelab.sh
cd ${__DIR__}
cp -rf ReplaceGoogleCDN/extension/test/extension-v3-test/replace-google-frontend-cdn ./replace-google-frontend-cdn
EOF

cd ${__DIR__}

npm install
mkdir -p gh-pages/yn_xwlb_content
mkdir -p gh-pages/gh-pages

cp -f index.html gh-pages/
cp -f CNAME gh-pages

:<<EOF
cp -f ./Thanks-Mirror.html gh-pages
cp -rf replace-google-frontend-cdn gh-pages
EOF

npm run build
git branch -a

