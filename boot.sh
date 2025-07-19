#!/bin/bash
set -e

REPO_URL="https://github.com/saullbrandao/omarchy-overrides.git"
REPO_DIR="$HOME/.local/share/omarchy-overrides"
MIGRATIONS_DIR="$REPO_DIR/migrations"
CONFIG_DIR="$REPO_DIR/config"

if [ -d "$REPO_DIR/.git" ]; then
  echo "Updating System Setup..."
  git -C "$REPO_DIR" pull --quiet
else
  echo "Cloning System Setup..."
  git clone "$REPO_URL" "$REPO_DIR" >/dev/null
fi

# Run all migrations
for migration in "$MIGRATIONS_DIR"/*.sh; do
  if [ -f "$migration" ]; then
    echo "Running migration $migration..."
    bash "$migration"
  fi
done

# Copy config directories to ~/.config
echo "Copying configs..."
for dir in "$CONFIG_DIR"/*/; do
  if [ -d "$dir" ]; then
    dir_name=$(basename "$dir")
    mkdir -p "$HOME/.config/$dir_name"
    cp -r "$dir"* "$HOME/.config/$dir_name/"
  fi
done

# Add custom hypr config
HYPR_CUSTOM="source = $REPO_DIR/default/hypr/custom.conf"
grep -qxF "$HYPR_CUSTOM" ~/.config/hypr/hyprland.conf ||
  echo "$HYPR_CUSTOM" >>~/.config/hypr/hyprland.conf

# Add custom bash config
BASH_CUSTOM="source $REPO_DIR/default/bash/custom"
grep -qxF "$BASH_CUSTOM" ~/.bashrc ||
  echo "$BASH_CUSTOM" >>~/.bashrc

echo "All done!"
