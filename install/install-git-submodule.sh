#!/usr/bin/env bash

set -e

SUBMODULE_REPO=$1
SUBMODULE_PATH=$2
BRANCH=$3

if [[ -z $SUBMODULE_REPO || -z $SUBMODULE_PATH || -z $BRANCH ]]; then
    echo "Usage: $0 <submodule-repo-url> <submodule-path> <branch>"
    exit 1
fi

if git config -f .gitmodules --get-regexp "^submodule\.$SUBMODULE_PATH\." > /dev/null 2>&1; then
    echo "Submodule already registered"
else
    git submodule add -b "$BRANCH" "$SUBMODULE_REPO" "$SUBMODULE_PATH"
fi

if [ "${SUPPRESS_INIT:-}" != "true" ]; then
    git submodule sync --recursive
    git submodule update --init --recursive
fi