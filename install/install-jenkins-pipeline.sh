#!/usr/bin/env bash

set -e

if [[ ! -d "Assets" || ! -d "ProjectSettings" || ! -d "Packages" ]]; then
    echo "Ensure you're running this script from the root of the Unity project."
    exit 1
fi

git submodule add -b master https://github.com/Bon-Games/Unity-Jenkins-Pipeline.git BuildCICD

if [ "${SUPPRESS_INIT:-}" != "true" ]; then
    git submodule sync --recursive
    git submodule update --init --recursive
fi

exit $?