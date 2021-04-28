#!/bin/bash

_username="$USER,$HOSTNAME"
_useremail=upload-PTS@liu-yx.cn
_remoteurl=git@gitee.com:stupidpanther/public-temp-storage.git
_branchname="$USER,$HOSTNAME,$PWD"
_commitmessage="Commit by uploadPTS.sh, $USER, $HOSTNAME, $PWD"

#rm -rf ./.git/
git init
git config --local user.name ${_username}
git config --local user.email ${_useremail}

git remote add origin ${_remoteurl}
git pull origin master --allow-unrelated-histories
git checkout -b ${_branchname}

git add .
git commit -m "${_commitmessage}"
git pull origin ${_branchname} --allow-unrelated-histories
git push origin ${_branchname}
