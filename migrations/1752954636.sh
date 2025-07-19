if ! command -v fish &>/dev/null; then
  echo "Installing fish"
  yay -S --noconfirm --needed fish

  omarchy-symlinks
  exec fish
fi
