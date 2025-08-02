#!/bin/bash

set -e

LOCAL_FOLDER=$1

if [ -z "$LOCAL_FOLDER" ] || [ ! -d "$LOCAL_FOLDER" ]; then
  echo "Folder [$LOCAL_FOLDER] doesn't exit"
  exit 1
fi

# Ensure aws installed
# Windows
# python -m ensurepip --default-pip
# python -m pip install awscli

# MacOS
# brew install awscli

# Ensure AWS_S3_BUCKET_NAME exists
echo "Start uploading ... folder: $LOCAL_FOLDER to $AWS_S3_BUCKET_NAME"
aws s3 cp "$LOCAL_FOLDER" "s3://$AWS_S3_BUCKET_NAME/" --recursive

exit $?