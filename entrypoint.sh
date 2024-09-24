#!/bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

echo "Starts"
PROVIDER="$1"
WEB_HOOK_URL="$2"
TOKEN="$3"
CHANNEL_ID="$4"
CHAT_ID="$5"
CONNECTION_URL="$6"
THREAD_ID="$7"
MESSAGE="$8"

export PROVIDER=$PROVIDER
export WEB_HOOK_URL=$WEB_HOOK_URL
export TOKEN=$TOKEN
export CHANNEL_ID=$CHANNEL_ID
export CHAT_ID=$CHAT_ID
export CONNECTION_URL=$CONNECTION_URL

chatz -o --from-env -t=$THREAD_ID "$MESSAGE"
