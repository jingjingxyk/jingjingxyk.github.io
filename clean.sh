#!/bin/bash

set -exu

 __DIR__=$(cd "$(dirname "$0")";pwd)
 cd ${__DIR__}
 test -d public/ && rm -rf public
 test -d docs/docs && rm -rf docs/docs
 test -d node_modules && rm -rf node_modules
