#! /bin/bash

echo 'Create secret'
echo 'asd1234' > password.txt
kubectl create secret generic mysql --from-file=password.txt

echo 'Deploy MySQL'
kubectl create -f mysql.yaml
kubectl create -f mysql-service.yaml

echo 'Deploy and Expose WordPress'
kubectl create -f wordpress.yaml
kubectl create -f wordpress-service.yaml

echo 'Check External IP'
kubectl get svc -l app=wordpress