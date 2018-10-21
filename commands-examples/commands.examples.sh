#!/bin/bash

# Examine the current status of your cluster
kubectl get nodes

# Examin pods running on our Kubernetes nodes
kubectl get pods --all-namespaces -o wide

# Examin pods running on a node
# kubectl describe node [node-name]
kubectl describe node ohlad6.mylabserver.com

# Check if node is low on memory
# kubectl describe node [node-name] will list DiskPressure and MemoryPressure statuses so you can see how it is doing
kubectl describe node ohlad5.mylabserver.com

# What pods are running in the kube-system namespace?
kubectl get pods -n kube-system
