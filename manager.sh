#!/bin/bash

# Inicializando o cluster definindo o IP do VM gerenciadora
sudo docker swarm init --advertise-addr=10.10.10.100 

# Armazenando o token para inclusão de VMs ao cluster
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh

