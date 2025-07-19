if command -v op &>/dev/null; then
  echo "Removing 1password"
  yay -Rns --noconfirm 1password-cli 1password-beta
fi
