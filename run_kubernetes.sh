#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="rusposevkin/udacity-api-cloud"
k8s_name="apidev"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $k8s_name --generator=run-pod/v1 --image=$dockerpath --port=80 --labels app=$k8s_name

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $k8s_name 8000:80

