#!/bin/bash

sudo apt-get update
sudo apt-get install docker -y
sudo apt-get install docker-compose -y
sudo apt-get install git-lfs -y
sudo apt-get update -y
sudo apt install unzip
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -G docker ubuntu

git clone https://github.com/scaleoutsystems/fedn.git
pushd fedn
git lfs pull
git checkout develop
# cp -r /home/ubuntu/configs/* /home/ubuntu/fedn/
#chown -R ubuntu:ubuntu /home/ubuntu/fedn

