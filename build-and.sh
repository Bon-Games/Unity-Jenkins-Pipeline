#!/bin/bash

BUILD_NUMBER=$1
BUILD_ENVIRONMENT=$2

chmod +x "${SCRIPT_WORKSPACE}/unity-build.sh"
"${SCRIPT_WORKSPACE}/unity-build.sh" Android $BUILD_ENVIRONMENT Client $BUILD_NUMBER

exit $?