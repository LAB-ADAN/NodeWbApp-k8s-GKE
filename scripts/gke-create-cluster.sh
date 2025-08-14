#!/usr/bin/env bash
set -e
CLUSTER="${1:-labadan}"
ZONE="${2:-us-central1-a}"
PROJECT="$(gcloud config get-value project)"
gcloud container clusters create "$CLUSTER" --num-nodes 3 --machine-type e2-micro --zone "$ZONE" --project "$PROJECT"
gcloud container clusters get-credentials "$CLUSTER" --zone "$ZONE" --project "$PROJECT"
