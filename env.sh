#!/bin/bash

# Input
ENVIRONMENT=$1
echo 'env.sh:SCRIPT_WORKSPACE ' $SCRIPT_WORKSPACE
echo 'env.sh:WORKSPACE ' $WORKSPACE

ENVIRONMENT_FILE=$(find $WORKSPACE -maxdepth 1 -type f -iname ".env.$ENVIRONMENT")

# Choose environment variables
if [[ ! -z $ENVIRONMENT_FILE ]]; then
	source $ENVIRONMENT_FILE
	echo 'Use Enviroment Variables in' $ENVIRONMENT_FILE
    # Export the environment variables to temporally file, which helpful in some case
    # E.g: load the file from Jenkinsfile
    printenv > $WORKSPACE/.env.temp
    echo '.env.temp is generated'
else
    echo 'Cound not find env file' $ENVIRONMENT
fi