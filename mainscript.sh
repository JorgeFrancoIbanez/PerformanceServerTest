#!/bin/bash

source  installnode.sh

# install
cd /home/ubuntu
wget http://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.09.04.tar.gz
tar zxvf stress-ng-0.09.04.tar.gz
cd /home/ubuntu/stress-ng-0.09.04
make

cd /home/ubuntu/autoscalescript
npm install express request
# Run the webserver server.js
node server.js &


# Stress one core
# stress -c 1 &

# # Save current crontab to my cron
# crontab -l > mycron

# # Stress CPU every 1 hours , unstress every 1 hours offset by 30 mins
# echo "30  * * * * stress -c 2" >> mycron
# echo '0   * * * * pids=$(pgrep stress) && kill $pids' >> mycron

# # Apply file mycron as a crontab config
# crontab mycron

# Execute the command at a scpecific time
# echo 'pids=$(pgrep stress) && kill $pids' | at 20:30

# # Simple python Hello Wold http server
# echo "<html><body>Hello World $(date)</body></html>" > ~/index.html
# cd ~
# python -m SimpleHTTPServer 80
