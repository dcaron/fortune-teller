#!/usr/bin/env bash

pks login -a https://api.pks.gcp.cloud-native.cf -u dcaron -p Pivotal2018 --skip-ssl-validation
pks create-cluster pipo --external-hostname pipo.pks.gcp.cloud-native.cf --plan small --num-nodes 3
pks clusters
pks get-credentials pipo
kubectl cluster-info



kubectl apply -f pks/conf-database.yml
kubectl apply -f pks/conf-secrets.yaml

fortune-service-k8s-database.yml
