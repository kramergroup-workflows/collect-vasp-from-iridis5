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
# We pipe this through a tar command because it allows to write files to a folder without wildcards (which are problematic in scp)
mkdir -p /data/vasp
ssh -i /ssh/id_rsa -oStrictHostKeyChecking=no $USERNAME@$HOSTNAME "tar czf - -C /scratch/$USERNAME/$BASEDIR/$JOB_NAME ." | tar xzf - -C /data/vasp

# Delete files from server
# ssh -i /ssh/id_rsa -oStrictHostKeyChecking=no $USERNAME@$HOSTNAME "rm -rf /scratch/$USERNAME/$BASEDIR/$JOB_NAME"