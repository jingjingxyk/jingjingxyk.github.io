#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)

__ROOT__=$(cd ${__DIR__}/../;pwd)

cd ${__ROOT__}

mkdir -p ${__ROOT__}/gh-pages/gh-pages
mkdir -p ${__ROOT__}/gh-pages/chromium-extension
mkdir -p ${__ROOT__}/gh-pages/release




