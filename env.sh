#!/bin/bash

# Input
ENVIRONMENT=$1

lookup_env_file() {
    local suffix="$1"  # The suffix to match after .env
    local envFileName=$(echo ".env.$suffix" | tr '[:upper:]' '[:lower:]')

    # Adjust the globbing pattern to include hidden files
    shopt -s dotglob  # Enable dotglob to include hidden files in globbing
    for file in *; do
        # Check if the entry is a file
        if [[ -f "$file" ]]; then
            # Convert filename to lowercase for comparison
            local fileName=$(echo "$file" | tr '[:upper:]' '[:lower:]')
            if [[ "$fileName" == "$envFileName" ]]; then
                echo "$file"
                shopt -u dotglob  # Disable dotglob to restore default behavior
                return 0
            fi
        fi
    done
    shopt -u dotglob  # Disable dotglob to restore default behavior
    return 1
}

ENVIRONMENT_FILE=$(lookup_env_file "$ENVIRONMENT")

# Choose environment variables
if [[ ! -z $ENVIRONMENT_FILE ]]; then
	source $ENVIRONMENT_FILE
	echo 'Use Enviroment Variables in' $ENVIRONMENT_FILE
    printenv
else
    echo 'Cound not find env file' $ENVIRONMENT
fi