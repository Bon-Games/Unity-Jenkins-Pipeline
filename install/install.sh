#!/usr/bin/env bash

set -e

if [[ ! -d "Assets" || ! -d "ProjectSettings" || ! -d "Packages" ]]; then
    echo "Ensure you're running this script from the root of the Unity project."
    exit 1
fi

git submodule add -b master git@github.com:Bon-Games/Unity-Jenkins-Pipeline.git Packages/BuildCICD
git submodule add -b master git@github.com:Bon-Games/Build-Tools.git Assets/BonGames.Tools
git submodule update --init --recursive

exit $?