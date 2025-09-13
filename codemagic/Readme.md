# Install
https://github.com/codemagic-ci-cd/cli-tools?tab=readme-ov-file#installing

# Troubleshoot
## Error: Only releases with status draft may be created on draft app
- It requires your app has to get passed by Google first (You don't need to rollout but it has to pass).
- Otherwise you have to use --draft mode for the command.

# Environment Variables
- GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_PATH : Path to Google Service Account