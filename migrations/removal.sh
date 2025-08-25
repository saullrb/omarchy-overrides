echo "Removing some apps"

for app in \
  "Basecamp" \
  "GitHub" \
  "Google Contacts" \
  "Google Messages" \
  "Google Photos" \
  "HEY" \
  "X" \
  "YouTube" \
  "Zoom"; do
  omarchy-webapp-remove "$app"
done

for pkg in \
  1password-beta \
  1password-cli \
  signal-desktop \
  spotify \
  typora \
  xournalpp; do

  if pacman -Qqe "$pkg" &>/dev/null; then
    echo "Removing $pkg..."
    yay -Rns --noconfirm "$pkg"
  fi
done

rm -f "$HOME/.local/share/applications/typora.desktop"
