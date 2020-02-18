#!/bin/bash


##################
# Install Node.js

# New Method
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Old Method
# plat=linux-x64
# nodev=8.9.4
# url="https://nodejs.org/dist/v$nodev/node-v$nodev-$plat.tar.gz"
# curl ${url} --progress-bar | tar xz
# cp -dR node-v$nodev-$plat/* /usr/local/
# rm -r node-v$nodev-$plat



