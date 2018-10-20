#!/bin/bash

# Run the pod
kubectl create -f alpine.yaml

# Delete the pod
kubectl delete pod alpine
# or "kubectl delete pod/alpine"

# Get pods
kubectl get pods --all-namespaces
