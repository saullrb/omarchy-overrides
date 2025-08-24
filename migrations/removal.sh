echo "Removing some apps"

source ~/.local/share/omarchy/default/bash/functions

for app in \
  "Basecamp" \
  "GitHub" \
  "Google Contacts" \
  "Google Messages" \
  "Google Photos" \
  "HEY" \
  "X" \
  "YouTube"; do
  web2app-remove "$app" 2>/dev/null
done

for pkg in \
  spotify \
  1password-cli \
  1password-beta \
  xournalpp \
  typora \
  signal-desktop \
  zoom; do

  if pacman -Qq "$pkg" &>/dev/null; then
    echo "Removing $pkg..."
    yay -Rns --noconfirm "$pkg"
  fi
done

if [ -f "$HOME/.local/share/applications/Zoom.desktop" ]; then
  rm "$HOME/.local/share/applications/Zoom.desktop"
fi
