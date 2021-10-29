#!/bin/bash

set -e

git config --global user.email "sunnythai786@gmail.com"
git config --global user.name "sunjay"
# git add .
# git commit -m "Deploying"
# git remote add production ssh://sunjay@49.0.71.34:3456/~/testproduction/nuxtapp
# git push --force production master

ssh -vvv -p 3456 sunjay@192.168.1.110 "cd /home/sunjay/testproduction/nuxtapp/; pwd; yarn install; git pull origin master; exit" 