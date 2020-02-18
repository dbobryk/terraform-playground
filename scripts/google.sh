#!/bin/sh

function checkIfBucketCreated() {

if [ "$GCS_BUCKET" == "" ]; then
  GCS_BUCKET=$RANDOM-terraform-$RANDOM
  gsutil mb gs://$GCS_BUCKET
  sleep 5s
  echo $GCS_BUCKET >> /workdir/configs/bucket
else
  echo "Bucket already created, using $GCS_BUCKET"
fi

}

function authWithServiceAccount() {

export GOOGLE_APPLICATION_CREDENTIALS=$CREDS
gcloud auth activate-service-account --key-file=$CREDS
gcloud config set project $PROJECT

}
