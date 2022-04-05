#!/bin/sh

cd docs
gitbook install
gitbook build . ./docs --gitbook=3.2.3 --debug --log=debug
# chown -R 1000:1000 .
