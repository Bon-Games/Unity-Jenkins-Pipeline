#!/bin/bash
set -e

## Uncomment these variables to run the script itself otherwise let set these environment variables outside
# WORKSPACE=$(pwd)
# XCODE_PROJECT_DIR=/Users/nd_toan/Personal/_01_UnityProjects/Test/Build
# IOS_EXPORT_OPTIONS=/BuildInformation/exportOptions.plist
# IOS_PROVISIONING_ID=8487c1f6-94df-4de2-a49b-425078284144
# IOS_DEVELOPMENT_TEAM_ID=R2TWY42MN5

# Internal variables
XCODE_ARCHIVE_DIR="$BUILD_DESTINATION"
SCHEME=Unity-iPhone
TARGET=Unity-iPhone
CONFIGURATION=Release
ARCHIVE_PATH="$XCODE_ARCHIVE_DIR/Unity-iPhone.xcarchive"

export XCODE_ARCHIVE_DIR
export ARCHIVE_PATH

# Function to lookup a file by name in the specified folder
lookup_file() {
    local rootFolder="$1"  # The root folder where the search starts
    local fileName="$2"    # The name or pattern of the file to search for

    # Check if the root folder exists
    if [[ ! -d "$rootFolder" ]]; then
        return 1
    fi
    # Find the file matching the name or pattern recursively
    find "$rootFolder" -type f -name "$fileName" -print -quit
}

# Function to lookup a folder by name in the specified folder
lookup_dir() {
    local rootFolder="$1"  # The root folder where the search starts
    local fileName="$2"    # The name or pattern of the file to search for

    # Check if the root folder exists
    if [[ ! -d "$rootFolder" ]]; then
        return 1
    fi
    # Find the file matching the name or pattern recursively
    find "$rootFolder" -type d -name "$fileName" -print -quit
}

printenv
# Export the environment variables to temporally file, which helpful in some case
# E.g: load the file from Jenkinsfile
printenv > ./.env.temp

SIGN_OPTIONS='-allowProvisioningUpdates'

if [[ -z $XCODE_PROJECT_DIR ]]; then
    echo "XCODE_PROJECT_DIR environment hasn't been set, use BUILD_DESTINATION $BUILD_DESTINATION"
    XCODE_PROJECT_DIR=$BUILD_DESTINATION
fi

if [[ -z $IOS_EXPORT_OPTIONS ]]; then
    echo "IOS_EXPORT_OPTIONS environment hasn't been set"
    exit 1
fi

if [[ ! -z "$IOS_PROVISIONING_ID" && ! -z "$IOS_DEVELOPMENT_TEAM_ID" ]] ; then
    echo "Your're using Manually Sign"
    SIGN_OPTIONS="DEVELOPMENT_TEAM=$IOS_DEVELOPMENT_TEAM_ID PROVISIONING_PROFILE=$IOS_PROVISIONING_ID"
else
    echo "Your're using Automatic Sign"
fi

# Lookup workspace file
XCODE_FILE=$(lookup_dir $XCODE_PROJECT_DIR "Unity-iPhone.xcworkspace")
if [[ ! -z $XCODE_FILE ]]; then
    XCODE_FILE="-workspace $XCODE_FILE"
else
    # Lookup project instead if the workspace doesn't exist
    XCODE_FILE="-project $(lookup_dir $XCODE_PROJECT_DIR "Unity-iPhone.xcodeproj")"
fi

# Print build information
echo "Build Information"
echo "Xcode File: ${XCODE_FILE}"
echo "Xcode-Select: $(xcode-select --print-path)" 
echo "Export options"
cat $WORKSPACE/$IOS_EXPORT_OPTIONS
xcodebuild -list $XCODE_FILE

echo "Start Archive >> Output: ${ARCHIVE_PATH}" 
echo "Archiving with DEVELOPMENT_TEAM=${DEVELOPMENT_TEAM} PROVISIONING_PROFILE=${PROVISIONING_PROFILE}"
# Archive
xcodebuild $XCODE_FILE \
-archivePath $ARCHIVE_PATH \
-scheme $SCHEME \
-configuration $CONFIGURATION \
$SIGN_OPTIONS \
archive

echo "Start Export Archive"
# Export the archive from previous step
xcodebuild -exportArchive -archivePath $ARCHIVE_PATH \
    -exportPath "$XCODE_ARCHIVE_DIR" \
    -configuration $CONFIGURATION \
    -exportOptionsPlist $WORKSPACE/$IOS_EXPORT_OPTIONS
exit $?