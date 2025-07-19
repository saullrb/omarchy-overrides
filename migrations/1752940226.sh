if ! command -v starship &>/dev/null; then
  echo "Add starship"
  yay -S --noconfirm --needed starship

  grep -qxF 'eval "$(starship init bash)"' ~/.bashrc ||
    echo 'eval "$(starship init bash)"' >>~/.bashrc

  exec bash
fi
