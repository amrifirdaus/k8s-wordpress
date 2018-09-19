#! /bin/bash

kubectl apply -f mysql-pv-claim.yaml
sleep 1m #waiting for pv mysql ready

kubectl apply -f wordpress-pv-claim.yaml
sleep 2m #waiting for pv wordpress ready

echo 'Check PVC'
kubectl get pvc