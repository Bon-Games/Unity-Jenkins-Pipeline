#!/bin/bash

BUILD_NUMBER=$1
BUILD_ENVIRONMENT=$2

# Export Xcode Project
chmod +x "${SCRIPT_WORKSPACE}/unity-build.sh"
"${SCRIPT_WORKSPACE}/unity-build.sh" iOS $BUILD_ENVIRONMENT Client $BUILD_NUMBER

# Archive and Export IPA
chmod +x "${SCRIPT_WORKSPACE}/build-ipa.sh"
"${SCRIPT_WORKSPACE}/build-ipa.sh"

exit $?