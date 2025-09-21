#!/usr/bin/env bash

set -e

if [[ ! -d "Assets" || ! -d "ProjectSettings" || ! -d "Packages" ]]; then
    echo "Ensure you're running this script from the root of the Unity project."
    exit 1
fi

"$SCRIPT_WORKSPACE/install/install-git-submodule.sh" https://github.com/Bon-Games/Build-Tools.git Assets/EasyBuilder master