# Unity-Jenkins-Pipeline
- Jenkins pipeline for a Unity Project

## Dependencies
- [Bon Games Build Tools](https://github.com/Bon-Games/Build-Tools)

## Install Option 1
1. Open Bash at Unity project root where Assets folder is located
2. Run `bash <(curl -fsSL https://raw.githubusercontent.com/Bon-Games/Unity-Jenkins-Pipeline/refs/heads/master/install/install.sh)`

## Install Option 2
1. Navigate to Unity's Packages folder
2. git clone git@github.com:Bon-Games/Unity-Jenkins-Pipeline.git BuildCICD --depth 1 --branch master --recursive

# Features
## Support to build
- Build Android
- Build iOS
- Unity Addressables

## Support Environment Specified
- To use the environment specified feature, you have to create at least one of these below files and put it root of Jenkins workspace
  - **Development** .env.development
  - **Staging** .env.staging
  - **Release** .env.release
  - **Distribution** .env.distribution
- See all supported templates at [templates](https://github.com/Bon-Games/Unity-Jenkins-Pipeline/tree/master/templates)
- See all supported variables at [Environment Variables](https://github.com/Bon-Games/Unity-Jenkins-Pipeline/tree/master/docs/EnvironmentVariables.md)

## Support Agent
- Windows OS
- Mac OS

# Cheat sheet
## Requirements
- Keep in mind, your're stading at BuildCICD/.. (1 directory up)
- Use bash terminal or whatever can run shell script
- Install [AWS S3 Cli](https://github.com/aws/aws-cli) and Credentials
- Install [GDrive Cli](https://github.com/glotlabs/gdrive) and Credentials

## To test build locally

1. [Android] chmod +x ./build-and.sh && UNITY_EXECUTABLE="C:\Program Files\Unity\Hub\Editor\2022.3.50f1\Editor/Unity.exe" SCRIPT_WORKSPACE="." BUILD_APP=true DLC_DESTINATION="Build/DlcRoot" BUILD_DLC=true ./build-and.sh Development 1 > log.txt

## Setup
1. Navigate to Unity's Packages folder
2. git clone git@github.com:Bon-Games/Unity-Jenkins-Pipeline.git BuildCICD --depth 1 --branch master --recursive
2.1 Add submodule git@github.com:Bon-Games/Unity-Jenkins-Pipeline.git in Packages folder



# Jenkins Plugins
1. Pipeline Utility Steps : 2.19.0

# Jenkins Setup
## Agent Configuration
1. At Definition field of Pipeline section, choose `Pipeline Script from SCM`
2. Fill out the fields
3. Add `Advanced sub-modules behaviours` then enable `Recursively update submodules` and `Use credentials from default remote of parent repository` options. Enable `Shallow clone`, set its value to 1.

## Windows
### Set Shell executable path
1. Open Jenkins -> Manage Jenkins -> System -> Shell executable
2. Paste "C:\Program Files\Git\bin\sh.exe" or whatever you have for Shell executable


# Jenkins Troubleshoot
**Error:** Failed to connect to repository : Command "git.exe ls-remote -h -- git@github.com:.. HEAD" returned status code 128: stdout: stderr: No ED25519 host key is known for github.com and you have requested strict checking.

**Fix** Run `ssh-keyscan github.com >> ~/.ssh/known_hosts`
