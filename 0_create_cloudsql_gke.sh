#!/bin/bash
source .env
gcloud sql instances create $APP_INSTANCE --tier=db-f1-micro --region=us-west1
gcloud sql users set-password $APP_DB_USERNAME --host=% --instance $APP_INSTANCE --password $APP_DB_PASSWORD
gcloud sql databases create $APP_DB_NAME --instance=$APP_INSTANCE

# k8s cluster
gcloud container clusters create test-cluster --labels=env=test --zone us-west1 --num-nodes=1 --machine-type=e2-micro

