#!/bin/bash

source /scripts/google.sh
source /scripts/terraform.sh
source /scripts/env.sh

setEnv

authWithServiceAccount

checkIfBucketCreated

terraformBuild
