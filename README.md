# k8s-wordpress
## Scalable WordPress deployment on Kubernetes Cluster

### Included Components
* GCP
* Kubernetes Cluster
* WordPress
* MySql

### Objectives
#### This scenario provides instruction for the following tasks:
* Provisioning Node Cluster
* Create local persistent volumes to define persistent disks.
* Create secret to protect sensitive data
* Create and deploy wordpress
* Create and deploy MySql

### Steps
#### 1. Create Node Cluster
Use gcloud tool to create a new cluster in a compute zone.

./gcloud_node_cluster.sh

#### 2. Create Persistent Disk
Create persistent disk using Google Cloud Platform Console
Go to Google Cloud Platform -> ConsoleCompute -> EngineDisks

At the top of the page click Create disk

Now under Source type you have to click None (blank disk) tab and set the size you want your disk to have

Disk Type: Standard persistent disk (cheaper option)

Enter zone, name and other parameters according to your needs.

Create persistent disk using the command line:

gcloud compute --project "test-project-216304" disks create "test-project-216304-wordpress" --zone "asia-southeast1-b" --size=5GB

##### 2.1 Add Persistent disk to Instance and Format It
##### 2.2 Detach Persistent disk from VM Instance
gcloud compute instances detach-disk  gke-my-cluster-default-pool-3fba0f9c-9wlx --disk test-project-216304-wordpress

gcloud compute instances start gke-my-cluster-default-pool-3fba0f9c-9wlx


#### 3. Create Services and deployments for WordPress and MySQL

./quickstart.sh

#### 4. Scalable
$ kubectl scale deployments/wordpress --replicas=2
deployment "wordpress" scaled

$ kubectl get deployments
