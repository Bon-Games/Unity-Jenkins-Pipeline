# Environment Variables Explanation

This table provides a detailed explanation of the environment variables used in the CI/CD pipeline.

| Variable Name | Category | Description | Example Value(s) | Notes |
|---|---|---|---|---|
| `GIT_CREDENTIALS_ID` | General | Jenkins credential ID for accessing the Git repository. | `jenkins_git_credentials` | This ID should be configured in Jenkins. |
| `GIT_URL` | General | The URL of the Git repository. | `git@github.com:<organization>/<repo>.git` | Replace `<organization>` and `<repo>` with your actual organization and repository name. |
| `CICD_PIPELINE_HOME` | General | Relative path within the Jenkins workspace that contains CI/CD scripts. | `BuildCICD` | The absolute path will be `${WORKSPACE}/${CICD_PIPELINE_HOME}`. |
| `UNITY_EDITOR_REVISION_MACOS` | Unity General | Path to the Unity Editor installation on macOS. | `/Applications/Unity/Hub/Editor` | |
| `UNITY_EDITOR_REVISION_LINUX` | Unity General | Path to the Unity Editor installation on Linux. | `/Applications/Unity/Hub/Editor` | |
| `UNITY_EDITOR_REVISION_WINDOWS` | Unity General | Path to the Unity Editor installation on Windows. | `C:/Program Files/Unity/Hub/Editor` | |
| `UNITY_VERSION` | Unity General | The specific Unity Editor version to be used for builds. | `2022.3.50f1` | |
| `BUILD_TARGET` | Unity Build | The target platform for the build. | `Android`, `iOS` | Acceptable values are `Android` and `iOS`. |
| `PRODUCT_NAME_CODE` | Product | A code name for the product, which will be part of the executable file name. | `project-code-name` | |
| `BUNDLE_ID` | Product | The unique bundle identifier for the application. | `com.example.project` | |
| `KEYSTORE_PATH` | Android | Relative path to the Android keystore file. | `BuildInfomation/And/keystore.ks` | |
| `KEYSTORE_PASSWORD` | Android | Password for the Android keystore. | `your-keystore-password` | **Important: Keep this secure and consider using Jenkins credentials for sensitive information.** |
| `KEYSTORE_ALIAS` | Android | Alias of the key within the keystore. | `your-keystore-alias` | |
| `KEYSTORE_ALIAS_PASSWORD` | Android | Password for the keystore alias. | `your-keystore-alias-password` | **Important: Keep this secure and consider using Jenkins credentials for sensitive information.** |
| `XCODE_PROJECT_DIR` | iOS | Optional: Relative path to the Xcode project directory. | (empty) | If left empty, the system might infer it or use a default. |
| `IOS_PROVISIONING_ID` | iOS | Optional: The provisioning profile ID for iOS signing. | (empty) | Optional if you are using manual signing. |
| `IOS_DEVELOPMENT_TEAM_ID` | iOS | The Apple Development Team ID for iOS signing. | `your-ios-development-team-id` | |
| `IOS_EXPORT_OPTIONS` | iOS | Relative path to the `exportOptions.plist` file for iOS archiving and export. | `BuildInfomation/iOS/exportOptions.plist` | |
| `AWS_SHARED_CREDENTIALS_FILE` | S3 | Path to the AWS shared credentials file. | `${CICD_PIPELINE_HOME}/aws/.ini` | |
| `AWS_S3_BUCKET_NAME` | S3 | The name of the Amazon S3 bucket for storing builds. | `s3-bucket-name` | |
| `GDRIVE_FOLDER_ID` | Google Drive | The Google Drive folder ID where the builds will be uploaded. | `your-gdrive-folder-id` | |