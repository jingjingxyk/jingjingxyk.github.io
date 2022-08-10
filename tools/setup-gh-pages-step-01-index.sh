#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)

__ROOT__=$(cd ${__DIR__}/../;pwd)

cd ${__ROOT__}

npm install

mkdir -p ${__ROOT__}/gh-pages/gh-pages

npm run build

cp -f index.html gh-pages/
cp -f CNAME gh-pages


git branch -a

