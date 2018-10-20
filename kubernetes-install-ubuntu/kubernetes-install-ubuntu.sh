#!/bin/bash

set -e
sudo apt-get upgrade -y
sudo apt-get update -y

sudo -i

sudo apt install -y docker.io

cat << EOF > /etc/docker/deamon.json
> {
>  "exec-opts": ["native.cgroupdriver=systemd"]
> }
> EOF

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt-get update -y
apt-get install kubelet kubeadm kubectl -y
