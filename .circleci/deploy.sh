#!/bin/bash
set -e
ssh-keyscan -H -p 3456 49.0.71.34 >> ~/.ssh/known_hosts
cat ~/.ssh/id_ed25519 | ssh -v -p 3456 sunjay@49.0.71.34 'cat >> .ssh/authorized_keys'
ssh -vvv  -o StrictHostKeyChecking=no -p 3456 sunjay@49.0.71.34 "cd /home/sunjay/testproduction/nuxtapp/; git pull origin master; yarn install; yarn build; pm2 reload test" 