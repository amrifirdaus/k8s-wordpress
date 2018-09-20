#! /bin/bash

echo 'Create secret'
kubectl create secret generic mysql --from-literal=password=yourpasswd
echo

echo 'Deploy MySQL'
kubectl create -f mysql.yaml
kubectl create -f mysql-service.yaml
echo

echo 'Waiting for mysql service ready'
sleep 5m #wait 5 minutes for mysql ready
kubectl get service mysql
echo 

echo 'Deploy and Expose WordPress'
kubectl create -f wordpress.yaml
kubectl create -f wordpress-service.yaml
echo

echo 'Waiting for wordpress service ready'
sleep 5m #wait 5 minutes for all pods ready
echo

echo 'Check External IP'
kubectl get svc -l app=wordpress
echo
x="$(kubectl get svc -l app=wordpress | awk '{ print $4 }' | grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}")"
echo "Done! The blog can be accessed at http://$x"