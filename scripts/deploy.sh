#!/usr/bin/env bash
set -e
kubectl apply -f manifests/deployment.yaml
kubectl apply -f manifests/service.yaml

echo "Waiting for Deployment to become available..."
kubectl rollout status deployment/nodewb-app --timeout=120s || true

echo "Waiting for External IP (this can take a minute)..."
for i in {1..30}; do
  IP=$(kubectl get svc nodewb-app-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null || true)
  if [ -n "$IP" ]; then
    echo "App URL: http://$IP:8080"
    exit 0
  fi
  sleep 5
done
echo "External IP not ready yet. Run: kubectl get svc nodewb-app-service"
