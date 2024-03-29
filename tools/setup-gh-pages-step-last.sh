#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)

__ROOT__=$(cd ${__DIR__}/../;pwd)

cd ${__ROOT__}


npm install

npm run build

cp -rf dist gh-pages/

cp -f index.html gh-pages/
cp -f CNAME gh-pages
cp -f robots.txt gh-pages

cp -rf vlogs gh-pages
cp -rf scholar gh-pages

cp -rf note gh-pages/
cp -rf frontend-experimental-features gh-pages/


git branch -a

