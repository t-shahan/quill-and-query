#!/bin/bash
# Historical deployment helper for a self-managed EC2 host.
# Quill & Query is decommissioned; this script is retained for reference and
# requires explicit operator configuration.
set -euo pipefail

: "${EC2_HOST:?Set EC2_HOST to the SSH target, for example ubuntu@example-host}"
: "${SSH_KEY_PATH:?Set SSH_KEY_PATH to the private-key file}"
REMOTE_APP_DIR="${REMOTE_APP_DIR:-quill-and-query}"

ssh -i "$SSH_KEY_PATH" "$EC2_HOST" "
  set -e
  cd \"$REMOTE_APP_DIR\"
  git pull origin main
  docker compose down
  docker compose build --no-cache
  docker compose up -d
"
