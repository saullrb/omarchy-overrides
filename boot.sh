#!/bin/bash
set -e

REPO_URL="https://github.com/saullbrandao/omarchy-overrides.git"
REPO_DIR="$HOME/.local/share/omarchy-overrides"
INSTALL_DIR="$REPO_DIR/install"
CONFIG_DIR="$REPO_DIR/config"

bash -c "$(wget -qO- https://omarchy.org/install)"

if [ -d "$REPO_DIR/.git" ]; then
  echo "Updating System Setup..."
  git -C "$REPO_DIR" pull --quiet
else
  echo "Cloning System Setup..."
  git clone "$REPO_URL" "$REPO_DIR" >/dev/null
fi

# Run all scripts in install directory
echo "Installing programs..."
for script in "$INSTALL_DIR"/*.sh; do
  if [ -f "$script" ]; then
    echo "Executing $script..."
    bash "$script"
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
grep -qxF 'source = ~/.config/hypr/custom.conf' ~/.config/hypr/hypr.conf ||
  echo 'source = ~/.config/hypr/custom.conf' >>~/.config/hypr/hypr.conf

# Add custom bash config
grep -qxF 'source ~/.local/share/omarchy-overrides/default/bash/custom' ~/.bashrc ||
  echo 'source ~/.local/share/omarchy-overrides/default/bash/custom' >>~/.bashrc

echo "All done!"
