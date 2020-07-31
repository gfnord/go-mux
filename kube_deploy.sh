#!/bin/bash
_VER=v`cat .current_version`
source .env
echo $_VER
sed  "s/_VER/$_VER/g" deployment_config_base.yaml > deployment_config.yaml

# start the deployment
kubectl apply -f deployment_config.yaml
kubectl apply -f service_db_config.yaml 
kubectl apply -f service_go-api_config.yaml 
kubectl apply -f ingress_config.yaml
