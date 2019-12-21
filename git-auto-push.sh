#!/usr/bin/env sh

TIME=`date "+%Y%m%d%H%M"`
git add .
git commit -a -m "dockerfile file change ${TIME}"
git push -u origin master



GIT_REVISION=`git log -1 --pretty=format:"%h"`
version=${TIME}_${GIT_REVISION}
tag_name=release-v${version}

git tag -l ${tag_name}
git push origin ${tag_name}
