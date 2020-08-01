#!/bin/bash
source .env

kubectl create secret generic cloudsql-instance-credentials --from-file=sql_credentials.json=sa-account.json

kubectl create secret generic cloudsql-db-credentials  \
  --from-literal=username=$APP_DB_USERNAME \
  --from-literal=password=$APP_DB_PASSWORD \
  --from-literal=dbname=$APP_DBNAME

