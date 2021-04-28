#!/bin/bash

_username="$USERNAME,$HOSTNAME"
_useremail=upload-PTS@liu-yx.cn
_remoteurl=https://gitee.com/stupidpanther/public-temp-storage.git
_branchname="$USERNAME,$HOSTNAME,$PWD"
_commitmessage="Commit by uploadPTS.sh, $USERNAME, $HOSTNAME, $PWD"

#rm -rf ./.git/
git init
git config --local user.name ${_username}
git config --local user.email ${_useremail}

git remote add PTS ${_remoteurl}
git pull PTS master --allow-unrelated-histories
git checkout -b ${_branchname}

git add .
git commit -m "${_commitmessage}"
git pull PTS ${_branchname} --allow-unrelated-histories
git push PTS ${_branchname}
