# Install
https://github.com/codemagic-ci-cd/cli-tools?tab=readme-ov-file#installing

# Troubleshoot
## Error: Only releases with status draft may be created on draft app
- It requires your app has to get passed by Google first (You don't need to rollout but it has to pass).
- Otherwise you have to use --draft mode for the command.

## Error: Argument --bundle/-d Not a valid bundle
- You might have to install Java and set it to enviroment variable on your machine.

# Environment Variables
- GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_PATH : Path to Google Service Account