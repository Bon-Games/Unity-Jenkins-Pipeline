#!/bin/bash

TRACK=$1
VERSION_CODES=$2

set -e

BUNDLE_PATH=$(find $BUILD_DESTINATION -type f -name "*.aab" | head -n 1)
echo "Start uploading App Bundle to Google Play Store from path: $BUNDLE_PATH"

if [ -z "$BUNDLE_PATH" ]; then
    echo "Error: BUNDLE_PATH is not set."
    exit 1
fi

if [ -z "$VERSION_CODES" ]; then
    echo "Error: Either VERSION_CODES is NOT set."
    exit 1
fi


if [ -f "$GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_PATH" ]; then
    echo "Uses the $GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_PATH"
    GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS=$(cat $GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_PATH)
    # echo "$GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS"
fi

if [[ -z "$GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_PATH" && -z "$GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS" ]]; then
    echo "Error: Either GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_PATH or GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS is NOT set."
    exit 1
fi

if [ -n "$BUNDLE_ID" ]; then
    echo "Getting track list for the bundle id: $BUNDLE_ID .."
    google-play tracks list --json --log-stream=stdout \
        --credentials="$GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS" \
        --package-name $BUNDLE_ID
fi

# The ${@:3} to support additional parameters, it is designed for --draft specifically
google-play bundles publish --json --log-stream=stdout ${@:3} \
    --credentials="$GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS" \
    --track "$TRACK" \
    --bundle "$BUNDLE_PATH"

echo "Uploading App Bundle to Google Play Store finished"
exit $?