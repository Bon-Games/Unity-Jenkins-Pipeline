# Unity-Jenkins-Pipeline
- Jenkins pipeline for a Unity Project

# Dependencies:
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
