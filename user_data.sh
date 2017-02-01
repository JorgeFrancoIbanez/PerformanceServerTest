#!/bin/bash
# This is our bootstrap sequence

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
apt-get update
apt-get -y install git
apt-get -y install stress
apt-get -y install build-essential
cd /home/ubuntu/

git clone https://ftortega@bitbucket.org/ftortega/autoscalescript.git
cd /home/ubuntu/autoscalescript
source mainscript.sh





