#!/bin/bash

set -exu

__DIR__=$(cd "$(dirname "$0")";pwd)
cd ${__DIR__}

__ROOT__=$(cd ${__DIR__}/../ ;pwd)

export http_proxy=${1:+'http://127.0.0.1:8015'}
export https_proxy=${1:+'http://127.0.0.1:8015'}
mkdir -p dist
cd dist

test -d ${__ROOT__}/ajax/libs/ && rm -rf ${__ROOT__}/ajax/libs/

mkdir -p ${__ROOT__}/ajax/libs/

test -d reveal.js/.git || git clone -b 4.3.1   https://github.com/hakimel/reveal.js.git --depth=1  --progress
mkdir -p ${__ROOT__}/ajax/libs/reveal.js/4.3.1
cp -rf  reveal.js/dist/* ${__ROOT__}/ajax/libs/reveal.js/4.3.1/


test -d Modernizr/.git ||  git clone -b v3.12.0  https://github.com/Modernizr/Modernizr.git  --depth=1  --progress


#test -d samples/.git ||  git clone https://github.com/webrtc/samples.git  --depth=1  --progress

test -d frontend-utils/.git ||  git clone -b main https://github.com/jingjingxyk/frontend-utils.git  --depth=1 --progress
cp -f frontend-utils/utils.js ${__ROOT__}/ajax/libs/utils.js


test -f adapter-latest.js || wget -O adapter-latest.js	https://webrtc.github.io/adapter/adapter-latest.js

cp -rf adapter-latest.js ${__ROOT__}/ajax/libs/

unset http_proxy
unset https_proxy
cd Modernizr/
npm install
./bin/modernizr --help
./bin/modernizr -c lib/config-all.json --uglify -d modernizr.min.js

mkdir -p ${__ROOT__}/ajax/libs/modernizr/3.12.0/
cp modernizr.min.js ${__ROOT__}/ajax/libs/modernizr/3.12.0/

cd ${__ROOT__}

