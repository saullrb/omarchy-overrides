if ! command -v zellij &>/dev/null; then
  echo "Installing zellij"
  yay -S --noconfirm --needed zellij

  cp ~/.local/share/omarchy-overrides/config/zellij/config.kdl ~/.config/zellij/
  exec bash
fi
