#!/bin/bash
pwd=`pwd`
cd ~/Documents/github/misc-stuff/settings
git add .
git commit -m"update"
git push
cd $pwd
