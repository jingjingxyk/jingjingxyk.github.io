#!/bin/bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}


git clone -b main --depth=1 https://github.com/jingjingxyk/chrome-run-in-container-tools.git
cd chrome-run-in-container-tools
bash run-docker.sh
docker exec -i demo bash /workspace/run-prepare.sh
docker exec -i demo bash /workspace/run.sh
