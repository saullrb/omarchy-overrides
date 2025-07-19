echo "Changing hyprland custom config path..."
HYPR_CUSTOM="source = ~/.local/share/omarchy-overrides/default/hypr/custom.conf"

# Delete old config path
sed -i "\|^source = ~/.config/hypr/custom.conf\$|d" ~/.config/hypr/hyprland.conf
[ -f ~/.config/hypr/custom.conf ] && rm ~/.config/hypr/custom.conf

# Add the new one
grep -qxF "$HYPR_CUSTOM" ~/.config/hypr/hyprland.conf ||
  echo "$HYPR_CUSTOM" >>~/.config/hypr/hyprland.conf
