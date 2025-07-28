if ! command -v starship &>/dev/null; then
  echo "Installing starship"
  yay -S --noconfirm --needed starship
fi

if ! command -v tmux &>/dev/null; then
  echo "Installing tmux"
  yay -S --noconfirm --needed tmux
fi
