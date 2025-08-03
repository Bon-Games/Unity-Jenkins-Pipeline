#!/bin/bash

FOLDER_MAPPER_JSON_FILE=$1
LOCAL_FOLDER_ROOT=$2

set -e
exec python ${SCRIPT_WORKSPACE}/gdrive-cli/gdrive_download.py $FOLDER_MAPPER_JSON_FILE $LOCAL_FOLDER_ROOT
exit $?