#!/bin/bash

set -e

# Pull the images first, so kubeadm can build the containers more efficiently
sudo docker pull k8s.gcr.io/kube-scheduler-amd64:v1.10.1
sudo docker pull k8s.gcr.io/etcd-amd64:3.1.12
sudo docker pull k8s.gcr.io/kube-apiserver-amd64:v1.10.1
sudo docker pull k8s.gcr.io/kube-controller-manager-amd64:v1.10.1

# Initialize your cluster using its private IP address with the following command:
sudo kubeadm init --pod-network-cidr=10.224.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# K8s requires a pod network to function. We're going to use Flannel, so we need to pass in a flag to the deployment script so K8s knows how to configure itself.

# Deploy a Calico CNI for the Master Node with the following command:
#kubectl apply -f https://docs.projectcalico.org/v2.6/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml

# Deploy a Flannel CNI for the Master Node with the following command:
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Check to make sure everything is coming up properly
# kubectl get pods --all-namespaces

# On the master, you can watch the node come up by repeatedly running
# kubectl get nodes
