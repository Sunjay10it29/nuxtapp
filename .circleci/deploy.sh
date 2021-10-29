#!/bin/bash

set -e

# git config --global user.email "sunnythai786@gmail.com"
# git config --global user.name "sunjay"
# git init .
# git add .
# git commit -m "Deploying"
# git remote add production ssh://sunjay@49.0.71.34:3456/home/sunjay/testproduction/nuxtapp 
# git push --force production master
ssh-keyscan -H -p 3456 49.0.71.34 >> ~/.ssh/known_hosts
cat ~/.ssh/id_ed25519 | ssh -v -p 3456 sunjay@49.0.71.34 'cat >> .ssh/authorized_keys'
ssh -vvv  -o StrictHostKeyChecking=no -p 3456 sunjay@49.0.71.34 "cd /home/sunjay/testproduction/nuxtapp/; pwd; yarn install; yarn build; git pull origin master; pm2 start yarn --name test -- start --watch" 