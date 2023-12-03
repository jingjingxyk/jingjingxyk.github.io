#!/bin/bash

set -exu

__DIR__=$(cd "$(dirname "$0")";pwd)
cd ${__DIR__}

__ROOT__=$(cd ${__DIR__}/../ ;pwd)

while [ $# -gt 0 ]; do
  case "$1" in
  --proxy)
    export HTTP_PROXY="$2"
    export HTTPS_PROXY="$2"
    NO_PROXY="127.0.0.0/8,10.0.0.0/8,100.64.0.0/10,172.16.0.0/12,192.168.0.0/16,198.18.0.0/15,169.254.0.0/16"
    NO_PROXY="${NO_PROXY},127.0.0.1,localhost"
    ;;
  esac
  shift $(($# > 0 ? 1 : 0))
done

mkdir -p dist
cd dist

test -d ${__ROOT__}/ajax/libs/ && rm -rf ${__ROOT__}/ajax/libs/

mkdir -p ${__ROOT__}/ajax/libs/


test -d reveal.js/.git || git clone -b 4.3.1   https://github.com/hakimel/reveal.js.git --depth=1  --progress
test -d Modernizr/.git ||  git clone -b v3.12.0  https://github.com/Modernizr/Modernizr.git  --depth=1  --progress
# test -d samples/.git ||  git clone https://github.com/webrtc/samples.git  --depth=1  --progress
test -d frontend-utils/.git ||  git clone -b main https://github.com/jingjingxyk/frontend-utils.git  --depth=1 --progress
test -f adapter-latest.js || wget -O adapter-latest.js	https://webrtc.github.io/adapter/adapter-latest.js
test -d highlight.js/.git || git clone -b 11.6.0	https://github.com/highlightjs/highlight.js.git --depth=1  --progress
# test -d three.js/.git || git clone -b 11.6.0	https://github.com/mrdoob/three.js.git --depth=1  --progress

test -d marked/.git || git clone -b v4.1.0	https://github.com/markedjs/marked.git --depth=1  --progress
test -d svelte-jsoneditor/.git || git clone -b main https://github.com/josdejong/svelte-jsoneditor.git --depth=1 --progress
#test -d SIP.js/.git || git clone -b main https://github.com/onsip/SIP.js.git --depth=1 --progress
test -d SIP.js/.git || git clone -b 0.21.2 https://github.com/onsip/SIP.js.git --depth=1 --progress

curl -Lo opencv.js https://docs.opencv.org/5.x/opencv.js

unset http_proxy
unset https_proxy


cd ${__DIR__}/dist
cd  reveal.js/
#npm install
#npm run build
mkdir -p ${__ROOT__}/ajax/libs/reveal.js/4.3.1
cp -rf  dist/* ${__ROOT__}/ajax/libs/reveal.js/4.3.1/
cp -rf  plugin ${__ROOT__}/ajax/libs/reveal.js/4.3.1/


cd ${__DIR__}/dist
mkdir -p ${__ROOT__}/ajax/libs/jingjingxyk/frontend-utils/
cp -f frontend-utils/utils.js ${__ROOT__}/ajax/libs/jingjingxyk/frontend-utils/utils.js


cd ${__DIR__}/dist
mkdir -p ${__ROOT__}/ajax/libs/webrtc/adapter
cp -rf adapter-latest.js ${__ROOT__}/ajax/libs/webrtc/adapter


cd ${__DIR__}/dist
cd Modernizr/
npm install
./bin/modernizr --help
./bin/modernizr -c lib/config-all.json --uglify -d modernizr.min.js
mkdir -p ${__ROOT__}/ajax/libs/modernizr/3.12.0/
cp modernizr.min.js ${__ROOT__}/ajax/libs/modernizr/3.12.0/


cd ${__DIR__}/dist
cd highlight.js
npm install
npm run build-cdn



mkdir -p ${__ROOT__}/ajax/libs/highlight.js/11.6.0
cp -rf build/* ${__ROOT__}/ajax/libs/highlight.js/11.6.0


cd ${__DIR__}/dist
cd marked
npm install
npm run build

mkdir -p ${__ROOT__}/ajax/libs/marked/v4.1.0
cp -rf marked.min.js  ${__ROOT__}/ajax/libs/marked/v4.1.0
cp -rf lib/*  ${__ROOT__}/ajax/libs/marked/v4.1.0




cd ${__DIR__}/dist

mkdir -p ${__ROOT__}/ajax/libs/josdejong/svelte-jsoneditor/main
cd svelte-jsoneditor
npm install
npm run build
cp -rf package-vanilla/* ${__ROOT__}/ajax/libs/josdejong/svelte-jsoneditor/main

cd ${__DIR__}/dist
mkdir -p ${__ROOT__}/ajax/libs/opencv/5.x/
cp -f opencv.js ${__ROOT__}/ajax/libs/opencv/5.x/

cd ${__DIR__}/dist
mkdir -p ${__ROOT__}/ajax/libs/sip.js/0.21.2
cd SIP.js
npm install
npm run build
npm run build-bundles
cp -rf lib ${__ROOT__}/ajax/libs/sip.js/0.21.2
cp -rf dist/* ${__ROOT__}/ajax/libs/sip.js/0.21.2
cd ${__ROOT__}

