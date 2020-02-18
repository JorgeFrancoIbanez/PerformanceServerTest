#!/bin/bash

source  installnode.sh

# install
sudo apt install tar
cd /home/ubuntu
wget https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.11.00.tar.xz
tar -xf stress-ng-0.11.00.tar.xz
#tar zxvf stress-ng-0.11.00.tar.xz
cd /home/ubuntu/stress-ng-0.11.00
make

cd /home/ubuntu/autoscalescript
npm install express node-fetch bluebird

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
