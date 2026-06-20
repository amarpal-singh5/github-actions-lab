#!/bin/bash

set -e

echo "Applying Kubernetes manifests..."

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Waiting for rollout..."
kubectl rollout status deployment/kubernetes-gitops-platform

echo "Deployment complete"
