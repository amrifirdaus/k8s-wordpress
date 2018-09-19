#! /bin/bash

echo 'Create secret'
echo 'asd1234' > password.txt
kubectl create secret generic mysql --from-file=password.txt
echo
echo 'Deploy MySQL'
kubectl create -f mysql.yaml
kubectl create -f mysql-service.yaml
echo
echo 'Waiting for mysql service ready'
sleep 10m #wait 10 minutes for mysql ready
kubectl get service mysql

echo 'Deploy and Expose WordPress'
kubectl create -f wordpress.yaml
kubectl create -f wordpress-service.yaml
echo
echo 'Waiting for wordpress service ready'
sleep 10m #wait 10 minutes for all pods ready
echo 'Check External IP'
kubectl get svc -l app=wordpress