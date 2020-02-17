#!/bin/bash

CREDS=/workdir/account.json
PROJECT=$(cat /workdir/configs/project)
BUCKET=dbobryk-terraform-$RANDOM

export GOOGLE_APPLICATION_CREDENTIALS=$CREDS
gcloud auth activate-service-account --key-file=$CREDS
gcloud config set project $PROJECT
gsutil mb gs://$BUCKET
sleep 10s
cd /workdir
sed -i -e "s/STATE-BUCKET/$BUCKET/g" main.tf
sed -i -e "s/PROJECT-ID/$PROJECT/g" variables.tf
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
