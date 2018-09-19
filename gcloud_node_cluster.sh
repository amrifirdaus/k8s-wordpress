#!/bin/bash
echo 'Set config project, zone and create clusters'
gcloud config set project training-216804
gcloud config set compute/zone asia-southeast1-b
gcloud container clusters create k8s-wordpress --num-nodes 3 --machine-type g1-small