#!/bin/bash

GDRIVE_FOLDER_ID=$GDRIVE_FOLDER_ID

# Folder contains the file to upload
UPLOADING_FOLDER=$1
# File name or wildcard (for example: *.apk)
FILE_NAME=$2

if [ -z "$GDRIVE_FOLDER_ID" ]; then
  echo "GDRIVE_FOLDER_ID is not set, please set it in the environment or pass it as an argument."
  exit 0
fi

if [ -z "$UPLOADING_FOLDER" ] || [ ! -d "$UPLOADING_FOLDER" ]; then
  echo "Folder [$UPLOADING_FOLDER] doesn't exist"
  exit 0
fi

FILE_PATH=$(find $UPLOADING_FOLDER -type f -name "$FILE_NAME")
if [ -z "$FILE_PATH" ]; then
  echo "File [$FILE_NAME] not found in folder [$UPLOADING_FOLDER]"
  # Doesn't exist, exit with success, doesn't need to fail the build
  exit 0
fi

echo "Uploading $FILE_PATH to Google Drive folder with ID: $GDRIVE_FOLDER_ID"

# If this failed it will not fail the build
gdrive files upload --parent "$GDRIVE_FOLDER_ID" "$FILE_PATH" || true