if ! command -v starship &>/dev/null; then
  echo "Installing starship"
  yay -S --noconfirm --needed starship

  exec bash
fi
