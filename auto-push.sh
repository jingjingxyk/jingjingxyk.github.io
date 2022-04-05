#!/usr/bin/env sh

TIME=$(date -u +"%Y%m%dT%H%M%SZ")
git add .
git commit -a -m "[`date -u '+%Y-%m-%dT%H:%M:%SZ'`] Auto update by script"
git push -u origin main



#GIT_REVISION=`git log -1 --pretty=format:"%h"`
#version=${TIME}_${GIT_REVISION}
#tag_name=release-v${version}
#
#git tag -l ${tag_name}
#git push origin ${tag_name}
