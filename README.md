# 🚀 Unity-Jenkins-Pipeline

A comprehensive Jenkins pipeline designed for building and deploying Unity projects across multiple platforms.

---

## ✨ Features

- **Multi-Platform Builds**: Build for Android, iOS, and Desktop with environment-specific configurations.
- **Addressables Support**: Build Unity Addressables alongside your main application.
- **iOS Deployment**: Upload builds directly to TestFlight.
- **Android Deployment**: Upload builds directly to the Google Play Console.
- **Share to Google Drive**: Upload executables to Google Drive.
- **Asset Delivery**: Upload Addressables, DLC, or Asset Bundles to AWS S3.

---

## 🔗 Dependencies

* [Bon Games Unity SDK](https://github.com/Bon-Games/BonGames-Unity-SDK.git)

---

## 💻 Build Machine Requirements

### Credentials
* **(Required for iOS)** Your macOS machine must have the necessary Apple Developer certificates and provisioning profiles installed to sign iOS builds.

### Jenkins Plugins
* **(Required)** **Pipeline Utility Steps**: `2.19.0`.

### Optional Command-Line Tools
* **AWS CLI**: Required for uploading assets to AWS S3.
    * Install from the [official AWS CLI documentation](https://aws.amazon.com/cli/).
    * Ensure your credentials are configured correctly.
* **gdrive CLI**: Required for uploading builds to Google Drive.
    * Install from the [gdrive GitHub repository](https://github.com/glotlabs/gdrive).
    * Ensure your credentials are configured correctly.
* **Codemagic CLI Tools**: Required for uploading builds to the Google Play Console.
    * See the [Codemagic CLI Tools Readme](./codemagic/Readme.md) for setup instructions.

---

## 🚀Plugin installation into Unity Project

### Option 1: Install Pipeline and BonGames Unity SDK
1.  In your terminal, navigate to the root directory of your Unity project (the one containing the `Assets` folder).
2.  Run the following command:
    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/Bon-Games/Unity-Jenkins-Pipeline/refs/heads/master/install/install.sh)
    ```

### Option 2: Install Pipeline Only (If BonGames SDK is already installed)
1.  In your terminal, navigate to the root directory of your Unity project.
2.  Run the following command:
    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/Bon-Games/Unity-Jenkins-Pipeline/refs/heads/master/install/install-jenkins-pipeline.sh)
    ```

### 📌 Important Notes
* All shell commands should be executed from the **root of your Unity project**.
* These scripts are designed for a `bash`-compatible shell (like Git Bash on Windows or the default terminal on macOS/Linux).

---

## ⚙️ Environment-Specific Builds
To enable environment-specific configurations, create one or more of the following `.env` files in the **root of your Jenkins workspace**:

* **Development**: `.env.development`
* **Staging**: `.env.staging`
* **Release**: `.env.release`
* **Distribution**: `.env.distribution`

You can find templates for these files in the [Templates](./templates) directory. For a complete list of supported variables, please refer to the [Environment Variables documentation](./docs/EnvironmentVariables.md).

---

## 🛠️ Supported Agents

* Windows OS
* macOS

---

## 🔧 Jenkins Setup

### Pipeline Configuration
1.  In your Jenkins pipeline job configuration, under the **Pipeline** section, set the **Definition** to `Pipeline script from SCM`.
2.  Configure your SCM (e.g., Git) and provide the repository URL and credentials.
3.  In the **Behaviors** section, add `Advanced sub-module behaviours` and configure it as follows:
    * Enable `Recursively update submodules`.
    * Enable `Use credentials from default remote of parent repository`.
4.  (Optional) To speed up checkout, add a `Shallow clone` behavior and set the **Shallow clone depth** to `1`.

### Windows Agent Setup
#### Configure the Shell Executable
1.  Navigate to **Manage Jenkins > System**.
2.  Find the **Shell** section.
3.  In the **Shell executable** field, provide the path to your `sh.exe`, for example:
    ```
    C:\Program Files\Git\bin\sh.exe
    ```

---

## 🔍 Troubleshooting

### Error: Host Key Verification Failed
**Error Message:**
Failed to connect to repository : Command "git.exe ls-remote -h -- git@github.com:.. HEAD" returned status code 128: stdout: stderr: No ED25519 host key is known for github.com and you have requested strict checking.
**Solution:**
This error occurs because the Jenkins agent does not trust the host key for `github.com`. Run the following command on your Jenkins agent machine to add the key to its list of known hosts:
```bash
ssh-keyscan github.com >> ~/.ssh/known_hosts