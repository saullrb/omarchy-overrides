if ! command -v starship &>/dev/null; then
  echo "Installing starship"
  yay -S --noconfirm --needed starship
fi

if ! command -v zellij &>/dev/null; then
  echo "Installing zellij"
  yay -S --noconfirm --needed zellij
fi

if ! command -v fish &>/dev/null; then
  echo "Installing fish"
  yay -S --noconfirm --needed fish

  exec ~/.local/share/omarchy-overrides/bin/omarchy-symlinks
  exec fish
fi
