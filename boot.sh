#!/bin/bash
set -e

REPO_URL="https://github.com/saullbrandao/omarchy-overrides.git"
REPO_DIR="$HOME/.local/share/omarchy-overrides"

if [ -d "$REPO_DIR/.git" ]; then
  echo "Updating System Setup..."
  git -C "$REPO_DIR" pull --quiet
else
  echo "Cloning System Setup..."
  git clone "$REPO_URL" "$REPO_DIR" >/dev/null
fi

bash "$REPO_DIR/bin/omarchy-override"

echo "All done!"
