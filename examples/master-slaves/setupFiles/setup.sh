#!/bin/bash
sudo apt-get update -y
sudo apt-get install git-lfs -y
sudo snap install docker
sudo apt install unzip
# sudo systemctl enable docker
# sudo systemctl start docker
sudo usermod -aG sudo docker ubuntu

git clone https://github.com/scaleoutsystems/fedn.git
chown -R ubuntu:ubuntu /home/ubuntu/fedn
cd fedn
git checkout develop
chown -R ubuntu:ubuntu /home/ubuntu/fedn/*
# cp -r /home/ubuntu/configs/* /home/ubuntu/fedn/
#chown -R ubuntu:ubuntu /home/ubuntu/fedn
# sudo shutdown -r 1

