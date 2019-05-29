#!/bin/bash

# Check environment variables
if [ "$USERNAME" = "noone" ];
then
  echo "ERROR: No USERNAME provided"
  exit 1
fi

if [ ! -f "/ssh/id_rsa" ];
then
  echo "ERROR: RSA private-key file (/ssh/id_rsa) missing"
  exit 1
fi

# Delete unwanted files on server
ssh -i /ssh/id_rsa -oStrictHostKeyChecking=no $USERNAME@$HOSTNAME "rm /scratch/$USERNAME/$BASEDIR/$JOB_NAME/vasp.* /scratch/$USERNAME/$BASEDIR/$JOB_NAME/qscript"

# Copy the input files
scp -i /ssh/id_rsa -oStrictHostKeyChecking=no -r $USERNAME@$HOSTNAME:/scratch/$USERNAME/$BASEDIR/$JOB_NAME/* /data/vasp/*

# Delete files from server
# ssh -i /ssh/id_rsa -oStrictHostKeyChecking=no $USERNAME@$HOSTNAME "rm -rf /scratch/$USERNAME/$BASEDIR/$JOB_NAME"