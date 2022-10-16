#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)

__ROOT__=$(cd ${__DIR__}/../;pwd)

cd ${__ROOT__}

tset -d ${__ROOT__}/gh-pages/release && rm -rf ${__ROOT__}/gh-pages/release
mkdir -p ${__ROOT__}/gh-pages/release

cd ${__ROOT__}/gh-pages/

zip -r ${__ROOT__}/gh-pages/release/release.zip . \
  -x "${__ROOT__}/gh-pages/release/*" \
  -x "${__ROOT__}/gh-pages/CNAME"

cd ${__ROOT__}

# unzip  -d ${__ROOT__}/gh-pages/release/ ${__ROOT__}/gh-pages/release/release.zip

# wget -O jingjingxyk.github.io.zip https://www.jingjingxyk.com/release/release.zip
# mkdir -p jingjingxyk.github.io
# unzip  -d jingjingxyk.github.io jingjingxyk.github.io.zip
