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


while [ $# -gt 0 ]; do
  case "$1" in
  --proxy)
    export http_proxy="$2"
    export https_proxy="$2"
    export no_proxy="127.0.0.1,localhost,ssl.google-analytics.com,127.0.0.0/8,10.0.0.0/8,100.64.0.0/10,172.16.0.0/12,192.168.0.0/16,198.18.0.0/15,169.254.0.0/16"
    export no_proxy="${no_proxy},.aliyuncs.com,.taobao.org,.aliyun.com,cdn.unrealengine.com"
    export no_proxy="${no_proxy},.tsinghua.edu.cn,.ustc.edu.cn,.npmmirror.com"
    ;;
  --*)
    ;;
  esac
  shift $(($# > 0 ? 1 : 0))
done

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


cd ${__DIR__}



ls ${__ROOT__}/gh-pages/chromium-extension/ > ${__ROOT__}/gh-pages/chromium-extension/index.txt
