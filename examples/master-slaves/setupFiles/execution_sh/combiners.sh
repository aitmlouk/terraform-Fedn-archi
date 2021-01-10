#!/bin/bash
cp /home/ubuntu/fedn/config/combiner-dev.yaml /home/ubuntu/fedn/
cd fedn/
sudo docker network create fedn_default
sudo docker-compose -f combiner-dev.yaml up --build