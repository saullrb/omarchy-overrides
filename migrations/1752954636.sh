if ! command -v fish &>/dev/null; then
  echo "Installing fish"
  yay -S --noconfirm --needed fish

  exec ~/.local/share/omarchy-overrides/bin/omarchy-symlinks
  exec fish
fi
