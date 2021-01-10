#!/bin/bash
cp /home/ubuntu/fedn/config/reducer-dev.yaml /home/ubuntu/fedn/
sleep 1m
cd fedn/
sudo docker-compose -f reducer-dev.yaml -f config/extra-hosts-reducer.yaml up --build