#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)

__ROOT__=$(cd ${__DIR__}/../;pwd)

mkdir -p ${__ROOT__}/gh-pages/

cd ${__ROOT__}/with-puppeteer-get-data

pwd

npm install
node get-credit.js

cp chromium-credits.json ${__ROOT__}/gh-pages/


