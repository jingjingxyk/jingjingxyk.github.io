#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
__ROOT__=$(cd ${__DIR__}/../;pwd)

mkdir -p ${__ROOT__}/gh-pages/chromium-extension

mkdir -p ${__DIR__}/dist

cd ${__DIR__}/dist

export http_proxy=${1:+'http://127.0.0.1:8015'}
export https_proxy=${1:+'http://127.0.0.1:8015'}

test -d ReplaceGoogleCDN/.git || git clone https://github.com/justjavac/ReplaceGoogleCDN.git --depth=1 --progress

cd ReplaceGoogleCDN
bash release-archive.sh
cp dist/extension-v2.zip ${__ROOT__}/gh-pages/chromium-extension/ReplaceGoogleCDN-v2.zip
cp dist/extension-v3.zip ${__ROOT__}/gh-pages/chromium-extension/ReplaceGoogleCDN-v3.zip


cd ${__DIR__}/dist

test -d extension-v3-test/.git ||  git clone https://github.com/jingjingxyk/extension-v3-test.git --depth=1 --progress

cd extension-v3-test
bash tools/release-archive.sh
cp dist/extension-v3-test.zip ${__ROOT__}/gh-pages/chromium-extension/extension-v3-test.zip

unset http_proxy
unset https_proxy

ls ${__ROOT__}/gh-pages/chromium-extension/ > ${__ROOT__}/gh-pages/chromium-extension/index.txt
