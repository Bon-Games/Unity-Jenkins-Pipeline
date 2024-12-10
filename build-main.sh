#!/bin/bash

# The folder contains this script is the root one
SCRIPT_WORKSPACE="$(cd "$(dirname "$0")" && pwd)"

# Input
BUILD_TARGET=$1
BUILD_ENVIRONMENT=$2
BUILD_NUMBER=$3

# Optional variables
if [[ ! -z $BUILD_DESTINATION ]]; then
    export BUILD_DESTINATION
fi

# Global Environment Variables
export SCRIPT_WORKSPACE

# Predefined Environment variables
source "$SCRIPT_WORKSPACE/args.sh" "$@"
source "$SCRIPT_WORKSPACE/env.sh" $BUILD_ENVIRONMENT

if [[ "$OSTYPE" == "darwin"* ]]; then
#MacOSX
UNITY_EXECUTABLE=$UNITY_EDITOR_REVISION_MACOS/$UNITY_VERSION/Unity.app/Contents/MacOS/Unity
elif [[ "$OSTYPE" == "linux"* ]]; then
#Linux
UNITY_EXECUTABLE=$UNITY_EDITOR_REVISION_LINUX/$UNITY_VERSION/Unity.app/Contents/Linux/Unity
else
#Windows (or Linux, GNU emulation)
UNITY_EXECUTABLE=$UNITY_EDITOR_REVISION_WINDOWS/$UNITY_VERSION/Editor/Unity.exe
fi

export UNITY_EXECUTABLE

BUILD_TARGET=$(echo "$BUILD_TARGET" | tr '[:upper:]' '[:lower:]')
BUILD_SCRIPT_NAME='unknow-script'

if [[ "$BUILD_TARGET" = "android" ]]; then
    BUILD_SCRIPT_NAME="build-and.sh"
elif [[ "$BUILD_TARGET" = "ios" ]]; then
    BUILD_SCRIPT_NAME="build-ios.sh"
else
    echo "Undefined build target ${BUILD_TARGET}"
    exit 1
fi

chmod +x "$SCRIPT_WORKSPACE/$BUILD_SCRIPT_NAME"
"$SCRIPT_WORKSPACE/$BUILD_SCRIPT_NAME" $BUILD_NUMBER $BUILD_ENVIRONMENT
# Exit
exit $?