# k8s-wordpress
## Scalable WordPress deployment With Google Kubernetes Engine

### Included Components
* GCP
* Google Kubernetes Engine
* WordPress
* MySql
* Bash

### Prerequisite
* Google Cloud SDK for run gcloud command
* kubectl for manage Kubernetes
* Project on GCP with API services activated	

### Objectives
#### This scenario provides instruction for the following tasks:
* Provisioning Node Cluster
* Create local persistent volumes to define persistent disks.
* Create secret to protect sensitive data
* Create and deploy MySQL
* Create and deploy WordPress
* Setup scaled WordPress

### Steps
#### 1. Create Node Cluster
Use gcloud tool to create a new cluster in a compute zone.

./gcloud_node_cluster.sh

#### 2. Create PersistentVolumes and PersistentVolumeClaims

./pv-claim.sh

#### 3. Create Services and Deployments for MySQL and WordPress

./deploy.sh

#### 4. Scalable WordPress
For increase to 3:

./resize-wp.sh 3

For reduce to 1

./resize-wp.sh 1
