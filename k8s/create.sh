#!/usr/bin/env bash

kubectl apply -f conf-database.yml
kubectl apply -f conf-secrets.yaml

kubectl apply -f fortune-service-k8s-database.yml
kubectl apply -f fortune-service-k8s-deployment-with-database-v2.yml
kubectl apply -f fortune-service-k8s-service.yml

kubectl apply -f conf-ui.yaml

kubectl apply -f fortune-teller-ui-k8s-deployment-v1.yml
kubectl apply -f fortune-teller-ui-k8s-service.yml






