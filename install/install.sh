#!/usr/bin/env bash

set -e

if [[ ! -d "Assets" || ! -d "ProjectSettings" || ! -d "Packages" ]]; then
    echo "Ensure you're running this script from the root of the Unity project."
    exit 1
fi

git submodule add -b master https://github.com/Bon-Games/Unity-Jenkins-Pipeline.git BuildCICD
git submodule add -b master https://github.com/Bon-Games/BonGames-Unity-SDK.git Packages/BonGames-Unity-SDK
git submodule update --init --recursive

exit $?