#!/bin/sh

terraformDestroy() {

  cd /workdir
  terraform destroy --auto-approve

}

terraformBuild() {

  cd /workdir
  sed -i -e "s/STATE-BUCKET/$GCS_BUCKET/g" main.tf
  sed -i -e "s/PROJECT-ID/$PROJECT/g" variables.tf
  terraform init
  terraform validate
  terraform plan -out=tfplan
  terraform apply tfplan

}
