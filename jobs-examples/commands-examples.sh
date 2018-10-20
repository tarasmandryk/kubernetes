#!/bin/bash

# Run the job
kubectl create -f pi-job.yaml

# Check the status of the job
kubectl describe job pi

# View the results of the job. Note that the precise code will vary. It is "pi-fmctx" in this example
kubectl logs pi-fmctx
