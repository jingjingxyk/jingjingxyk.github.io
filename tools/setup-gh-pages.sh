#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}


npm install
mkdir -p gh-pages/yn_xwlb_content
mkdir -p gh-pages/gh-pages

cp -f index.html gh-pages/
cp -f CNAME gh-pages


npm run build
git branch -a

