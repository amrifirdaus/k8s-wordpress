#! /bin/bash

kubectl scale deployment/wordpress --replicas=$1
kubectl get deployment