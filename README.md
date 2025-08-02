# Unity-Jenkins-Pipeline
- Jenkins pipeline for a Unity Project

## Dependencies
- [Bon Games Build Tools](https://github.com/Bon-Games/Build-Tools)

# Features
## Support to build
- Build Android
- Build iOS

## Support Environment Specified
- To use the environment specified feature, you have to create at least one of these below files and put it root of Jenkins workspace
  - **Development** .env.development
  - **Staging** .env.staging
  - **Release** .env.release
  - **Distribution** .env.distribution
- See all supported templates at [templates](https://github.com/Bon-Games/Unity-Jenkins-Pipeline/tree/master/templates)
- See all supported variables at [Environment Variables](https://github.com/Bon-Games/Unity-Jenkins-Pipeline/tree/master/docs/EnvironmentVariables.md)

# Cheat sheet
## Requirements
- Keep in mind, your're stading at BuildCICD/.. (1 directory up)
- Use bash terminal or whatever can run shell script

## To test build locally

1. [Android] chmod +x ./build-and.sh && UNITY_EXECUTABLE="C:\Program Files\Unity\Hub\Editor\2022.3.50f1\Editor/Unity.exe" SCRIPT_WORKSPACE="." BUILD_APP=true DLC_DESTINATION="Build/DlcRoot" BUILD_DLC=true ./build-and.sh Development 1 > log.txt
