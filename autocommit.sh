#!/bin/bash

while true
do
  git add ./autocommit.sh
  git add ./github/source
  git add ./django/source
  git add ./sphinx/source
  git commit -m 'auto commit'
  git push sphinx master
  echo "-----------------------"
  sleep 300
done
