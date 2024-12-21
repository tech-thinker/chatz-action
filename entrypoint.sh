#!/bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

# Starts processes
PROVIDER="$1"
WEB_HOOK_URL="$2"
TOKEN="$3"
CHANNEL_ID="$4"
CHAT_ID="$5"
CONNECTION_URL="$6"
THREAD_ID="$7"
REQUIRED_FAILED=$8

SMTP_HOST="$9"
SMTP_PORT="$10"
SMTP_USE_TLS=$11
SMTP_USE_STARTTLS=$12
SMTP_USER="$13"
SMTP_PASSWORD="$14"
SMTP_SUBJECT="$15"
SMTP_FROM="$16"
SMTP_TO="$17"

MESSAGE="$18"

export PROVIDER=$PROVIDER
export WEB_HOOK_URL=$WEB_HOOK_URL
export TOKEN=$TOKEN
export CHANNEL_ID=$CHANNEL_ID
export CHAT_ID=$CHAT_ID
export CONNECTION_URL=$CONNECTION_URL

chatz -o --from-env -t=$THREAD_ID "$MESSAGE"

# Check REQUIRED_FAILED
if [ "${REQUIRED_FAILED:-false}" = "true" ]; then
  exit 1
fi
