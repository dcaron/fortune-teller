#!/usr/bin/env bash

kubectl delete service fortune-teller-ui
kubectl delete deployment fortune-teller-ui

kubectl delete configmap fortune-ui

kubectl delete service fortune-service
kubectl delete deployment fortune-service

kubectl delete service fortune-service-database
kubectl delete deployment fortune-service-database

kubectl delete configmap fortune-service-database
kubectl delete secret fortune-service-database
