#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)

__ROOT__=$(cd ${__DIR__}/../;pwd)

cd ${__ROOT__}

export PATH=${__DIR__}/dist/node-v16.16.0-linux-x64/bin/:${__DIR__}/dist/go/bin/:$PATH

npm install

npm run build

cp -f index.html gh-pages/
cp -f CNAME gh-pages
cp -f robots.txt gh-pages

cp -rf vlogs gh-pages
cp -rf scholar gh-pages

cp -rf dist gh-pages/
cp -rf ajax gh-pages/
cp -rf note gh-pages/
cp -rf frontend-experimental-features gh-pages/
bash tools/release-archive-gh-pages.sh
git branch -a

