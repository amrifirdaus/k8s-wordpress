#! /bin/bash

kubectl apply -f mysql-pv-claim.yaml
kubectl apply -f wordpress-pv-claim.yaml
kubectl get pvc