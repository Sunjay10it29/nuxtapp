#!/bin/bash

set -e

rm -rf .git
rm -rf .gitignore
git config --global user.email "sunnythai786@gmail.com"
git config --global user.name "sunjay"
git add .
git commit -m "Deploying"
git remote add production ssh://sunjay@49.0.71.34:3456/~/testproduction/nuxtapp
git push --force production master

ssh -p 3456 sunjay@49.0.71.34 "cd ~/testproduction/nuxtapp/ && yarn install && pm2 status && exit" 