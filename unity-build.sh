#!/bin/bash

BUILD_TARGET=$1
BUILD_ENVIRONMENT=$2
BUILD_APP_TARGET=$3
BUILD_NUMBER=$4
ENVIRONMENT_VARIABLES=$5

# Ensure the directory exists
mkdir -p "$(dirname "$LOG_FILE")"

echo "This script is executing on $OSTYPE with environment variables"
printenv

echo "Start build with params $BUILD_TARGET $BUILD_NUMBER $BUILD_ENVIRONMENT $BUILD_APP_TARGET $ENVIRONMENT_VARIABLES"

"$UNITY_EXECUTABLE" -batchmode -exit -executeMethod BonGames.EasyBuilder.EasyBuilder.Build \
-projectPath "${SCRIPT_WORKSPACE}/../" 	\
-logFile - 	\
-productCode $PRODUCT_NAME_CODE \
-ks "$KEYSTORE_PATH" -ksPassword "$KEYSTORE_PASSWORD" -alias "$KEYSTORE_ALIAS" -aliasPassword "$KEYSTORE_ALIAS_PASSWORD" \
-iOSProvisioning $IOS_PROVISIONING_ID -iOSTeamId $IOS_DEVELOPMENT_TEAM_ID \
-buildNumber $BUILD_NUMBER -buildEnv $BUILD_ENVIRONMENT -buildPlatformTarget $BUILD_TARGET -buildAppTarget $BUILD_APP_TARGET \
-buildDestination "$BUILD_DESTINATION"
exit $?