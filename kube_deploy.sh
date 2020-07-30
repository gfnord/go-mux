#!/bin/bash
_VER=v`cat .current_version`
source .env
echo $_VER
sed  "s/_VER/$_VER/g" deployment_config_base.yaml > .deployment_config_temp.yaml
sed  "s/_POSTGRESPASSWORD/$POSTGRES_PASSWORD/g" .deployment_config_temp.yaml > deployment_config.yaml
rm -f .deployment_config_temp.yaml

# start the deployment
kubectl create -f deployment_config.yaml --save-config
sleep 15
kubectl create -f service_db_config.yaml --save-config
kubectl create -f service_go-api_config.yaml --save-config
