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
zip -r ReplaceGoogleCDN.zip ReplaceGoogleCDN

# 源码
cp -f ReplaceGoogleCDN.zip ${__ROOT__}/gh-pages/chromium-extension/ReplaceGoogleCDN.zip

cd ReplaceGoogleCDN
# 构建打包
bash release-archive.sh
cp -f dist/ReplaceGoogleCDN-v2.zip ${__ROOT__}/gh-pages/chromium-extension/ReplaceGoogleCDN-v2.zip
cp -f dist/ReplaceGoogleCDN-v3.zip ${__ROOT__}/gh-pages/chromium-extension/ReplaceGoogleCDN-v3.zip

mkdir -p ${__ROOT__}/gh-pages/chromium-extension/ReplaceGoogleCDN/rules/
cp -rf extension/rules/* ${__ROOT__}/gh-pages/chromium-extension/ReplaceGoogleCDN/rules/

cd ${__DIR__}/dist

test -d extension-v3-test/.git ||  git clone https://github.com/jingjingxyk/extension-v3-test.git --depth=1 --progress

cd extension-v3-test
bash tools/release-archive.sh
cp -f dist/extension-v3-test.zip ${__ROOT__}/gh-pages/chromium-extension/extension-v3-test.zip
mkdir -p ${__ROOT__}/gh-pages/chromium-extension/extension-v3-test/rules/
cp -rf rules/* ${__ROOT__}/gh-pages/chromium-extension/extension-v3-test/rules/

unset http_proxy
unset https_proxy

cd ${__DIR__}/dist/

## 实现无页面跳转收听正确读音，而开发的chromium扩展
test -d chinese-programmer-wrong-pronunciation-chromium-extension/.git ||  git clone https://github.com/jingjingxyk/chinese-programmer-wrong-pronunciation-chromium-extension.git --depth=1 --progress
cd chinese-programmer-wrong-pronunciation-chromium-extension
bash release-archive.sh
cp -f dist/chinese-programmer-wrong-pronunciation-chromium-extension.zip ${__ROOT__}/gh-pages/chromium-extension/chinese-programmer-wrong-pronunciation-chromium-extension.zip


# 下载谷歌翻译扩展源码
mkdir -p jingjingxyk-ReplaceGoogleCDN
cd jingjingxyk-ReplaceGoogleCDN

test -d ReplaceGoogleCDN/.git || git clone https://github.com/jingjingxyk/ReplaceGoogleCDN.git --depth=1 --progress
cd ReplaceGoogleCDN
# bash  extension/tools/download-chromium-extension.sh --proxy 1  # 使用代理
bash  extension/tools/download-chromium-extension.sh
cd extension/tools/temp/
zip -r google-translate.zip google-translate
cp google-translate.zip ${__ROOT__}/gh-pages/chromium-extension/
cp google-translate.crx ${__ROOT__}/gh-pages/chromium-extension/


cd ${__DIR__}



ls ${__ROOT__}/gh-pages/chromium-extension/ > ${__ROOT__}/gh-pages/chromium-extension/index.txt
