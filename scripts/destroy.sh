#!/bin/bash

CREDS=/workdir/account.json
PROJECT=$(cat /workdir/project)


export GOOGLE_APPLICATION_CREDENTIALS=$CREDS
gcloud auth activate-service-account --key-file=$CREDS
gcloud config set project $PROJECT
cd /workdir
terraform destroy --auto-approve