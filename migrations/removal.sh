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
  "YouTube" \
  "Zoom"; do
  web2app-remove "$app" 2>/dev/null
done

for pkg in \
  1password-beta \
  1password-cli \
  signal-desktop \
  spotify \
  typora \
  xournalpp; do

  if pacman -Qq "$pkg" &>/dev/null; then
    echo "Removing $pkg..."
    yay -Rns --noconfirm "$pkg"
  fi
done

if [ -f "$HOME/.local/share/applications/Zoom.desktop" ]; then
  rm "$HOME/.local/share/applications/Zoom.desktop"
fi
