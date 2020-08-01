#!/bin/bash
_VER=v`cat .current_version`
source .env
echo $_VER
sed  "s/_VER/$_VER/g" deployment_config_base.yaml > .deployment_config_temp1.yaml
connectionName=`gcloud sql instances describe $APP_INSTANCE | grep connectionName| awk '{print $2}'`
sed  "s/<INSTANCE_CONNECTION_NAME>/$connectionName/g" .deployment_config_temp1.yaml > deployment_config.yaml
rm -f .deployment_config_temp1.yaml

# start the deployment
kubectl apply -f deployment_config.yaml
kubectl apply -f service_go-api_config.yaml 
kubectl apply -f ingress_config.yaml
