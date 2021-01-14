#!/bin/bash
cp /home/ubuntu/fedn/config/docker-compose.yaml /home/ubuntu/fedn/docker-compose.yaml
cd fedn/
sudo docker network create fedn_default
sudo docker-compose -f ./config/docker-compose.yaml up --build