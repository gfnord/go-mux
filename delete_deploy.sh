#!/bin/bash
kubectl delete -f ingress_config.yaml --all
kubectl delete -f service_db_config.yaml --all
kubectl delete -f service_go-api_config.yaml --all
kubectl delete -f deployment_config.yaml --all
