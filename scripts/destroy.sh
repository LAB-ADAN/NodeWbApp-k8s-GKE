#!/usr/bin/env bash
set -e
# Delete Service first to stop LoadBalancer charges
kubectl delete -f manifests/service.yaml --ignore-not-found
kubectl delete -f manifests/deployment.yaml --ignore-not-found
echo "Deleted Kubernetes resources in the cluster."
# Optional: also delete the cluster (uncomment next line)
gcloud container clusters delete labadan --zone us-central1-a --quiet
