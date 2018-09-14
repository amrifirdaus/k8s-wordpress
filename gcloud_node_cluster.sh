gcloud config set project test-project-216304
gcloud config set compute/zone asia-southeast1-b
gcloud container clusters create my-cluster --num-nodes 1 --machine-type g1-small
gcloud container clusters get-credentials my-cluster --zone asia-southeast1-b --test-project-216304