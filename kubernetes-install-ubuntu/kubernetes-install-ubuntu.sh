#!/bin/bash

set -e
sudo apt-get upgrade -y
sudo apt-get update -y

sudo apt install -y docker.io

sudo echo "{" > /etc/docker/deamon.json
sudo echo ' "exec-opts": ["native.cgroupdriver=systemd"]' >> /etc/docker/deamon.json
sudo echo "}" >> /etc/docker/deamon.json

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install kubelet kubeadm kubectl -y
