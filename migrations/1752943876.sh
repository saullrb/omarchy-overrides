if ! command -v zellij &>/dev/null; then
  echo "Installing zellij"
  yay -S --noconfirm --needed zellij

  exec bash
fi
