#!/bin/bash

cd /home/support/python/note/sphinx
git add ./autocommit.sh
git add ./github/source
git add ./django/source
git add ./sphinx/source
git status
git commit -m 'auto commit'
git push sphinx master
echo "-----------------------"

exit 0

