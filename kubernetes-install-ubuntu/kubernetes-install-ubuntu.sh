#!/bin/bash

set -e
sudo apt-get upgrade
sudo apt-get update

sudo apt install -y docker.io

sudo -i

cat << EOF > /etc/apt/sources.list.d/kubernetes.list
> {
>  "exec-opts": ["native.cgroupdriver=systemd"]
> }
> EOF

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt-get update -y
apt-get install kubelet kubeadm kubectl -y
