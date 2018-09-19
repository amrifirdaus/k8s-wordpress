#! /bin/bash

echo 'Create secret'
kubectl create secret generic mysql --from-literal=password=asd1234
echo
echo 'Deploy MySQL'
kubectl create -f mysql.yaml
kubectl create -f mysql-service.yaml
echo
echo 'Waiting for mysql service ready'
sleep 5m #wait 5 minutes for mysql ready
kubectl get service mysql

echo 'Deploy and Expose WordPress'
kubectl create -f wordpress.yaml
kubectl create -f wordpress-service.yaml
echo
echo 'Waiting for wordpress service ready'
sleep 5m #wait 5 minutes for all pods ready
echo 'Check External IP'
kubectl get svc -l app=wordpress