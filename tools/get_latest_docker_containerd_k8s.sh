#!/bin/bash

set -exu

__DIR__=$(cd "$(dirname "$0")";pwd)
cd ${__DIR__}

__ROOT__=$(cd ${__DIR__}/../ ;pwd)

cd ${__ROOT__}
mkdir -p ${__ROOT__}/gh-pages/


curl -Lo ${__ROOT__}/gh-pages/dl.k8s.io.stable-1.txt https://dl.k8s.io/release/stable-1.txt
