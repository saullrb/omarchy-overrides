if ! command -v starship &>/dev/null; then
  echo "Installing starship"
  yay -S --noconfirm --needed starship
fi

if ! command -v zellij &>/dev/null; then
  echo "Installing zellij"
  yay -S --noconfirm --needed zellij
fi
