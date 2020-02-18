#!/bin/bash
# This is our bootstrap sequence

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
apt-get update
apt-get -y install git
apt-get -y install stress
apt-get -y install build-essential
cd /home/ubuntu/

git clone https://github.com/JorgeFrancoIbanez/atlastest.git
cd /home/ubuntu/atlastest
/bin/bash mainscript.sh





