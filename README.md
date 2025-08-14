# NodeWB App on Kubernetes (GKE-ready)

## Prereqs
- gcloud, kubectl
- GKE cluster creds (`scripts/gke-create-cluster.sh`)

## 1) Create GKE cluster (once)

./scripts/gke-create-cluster.sh labadan us-central1-a
## 2) Deploy app
./scripts/deploy.sh
### Watch for External IP; if not printed, run:
kubectl get svc nodewb-app-service

## 3) Delete resources (stop LB charges)
./scripts/destroy.sh
