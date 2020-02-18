#!/bin/sh

setEnv() {

  CREDS=/workdir/account.json
  PROJECT=$(cat /workdir/configs/project)
  GCS_BUCKET=$(cat /workdir/configs/bucket)

}
