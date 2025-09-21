#!/usr/bin/env bash

set -e

if [[ ! -d "Assets" || ! -d "ProjectSettings" || ! -d "Packages" ]]; then
    echo "Ensure you're running this script from the root of the Unity project."
    exit 1
fi

SUPPRESS_INIT=true ./install-easy-builder.sh
SUPPRESS_INIT=true ./install-jenkins-pipeline.sh

git submodule sync --recursive
git submodule update --init --recursive

exit $?