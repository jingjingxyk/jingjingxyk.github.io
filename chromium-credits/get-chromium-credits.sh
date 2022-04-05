#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}



pwd
cp ../yn_xwlb/package.json .
npm install
node get-credit.js



