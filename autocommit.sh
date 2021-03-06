#!/bin/bash

DIR=`dirname ${0}`
cd $DIR

git add ./autocommit.sh
git add ./github/source
git add ./django/source
git add ./sphinx/source
git status
git commit -m 'auto commit'
git push sphinx master

exit 0

