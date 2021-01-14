#!/bin/bash

useCase="casa"
cd /home/ubuntu/fedn/test/
sudo unzip -o casa.zip
sudo chown -R ubuntu:ubuntu /home/ubuntu/fedn/test/$useCase
sudo cp ../fedn-network.yaml  ./$useCase/
sudo cp ../extra-hosts-client.yaml / ./$useCase/
sudo docker network create fedn_default
cd $useCase

sudo docker-compose -f docker-compose.yaml -f extra-hosts-client.yaml up --scale client=15  --build