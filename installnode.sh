#!/bin/bash


##################
# Install Node.js

plat=linux-x64
nodev=6.9.5
url="https://nodejs.org/dist/v$nodev/node-v$nodev-$plat.tar.gz"
curl ${url} --progress-bar | tar xz
cp -dR node-v$nodev-$plat/* /usr/local/
rm -r node-v$nodev-$plat



