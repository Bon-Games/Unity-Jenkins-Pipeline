#!/usr/bin/env python

import json
import subprocess
import sys
import os

def downloadFolder(driveId, localDir):
    os.makedirs(localDir, exist_ok=True)
    print(f"Downloading folder {driveId} to {localDir} ...")
    subprocess.run(["gdrive", "files", "download", driveId,"--recursive", "--destination", localDir])

def main(jsonPath, localFolderRoot):
    with open(jsonPath, "r") as f:
        mapping = json.load(f)

    for driveId, localDir in mapping.items():
        downloadFolder(driveId, os.path.join(localFolderRoot, localDir)

if __name__ == "__main__":
    try:
        main(sys.argv[1], sys.argv[2])
    except Exception as e:
        print(f"An error occurred: {e}")
        sys.exit(1)
