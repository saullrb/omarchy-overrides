echo "Updating configs"

# Add my custom nvim plugins
if [ ! -f ~/.config/nvim/lua/plugins/custom.lua ]; then
  cat >~/.config/nvim/lua/plugins/custom.lua <<'EOF'
return dofile(vim.fn.expand("~/.local/share/omarchy-overrides/default/nvim/plugins.lua")) or {}
EOF
fi

# Add my custom nvim config
if ! grep -Fq 'dofile(vim.fn.expand("~/.local/share/omarchy-overrides/default/nvim/config.lua"))' ~/.config/nvim/lua/config/options.lua; then
  echo 'dofile(vim.fn.expand("~/.local/share/omarchy-overrides/default/nvim/config.lua"))' >>~/.config/nvim/lua/config/options.lua
fi

# Ensure custom hyprland config is sourced
grep -qxF 'source = ~/.local/share/omarchy-overrides/default/hypr/custom.conf' ~/.config/hypr/hyprland.conf ||
  echo 'source = ~/.local/share/omarchy-overrides/default/hypr/custom.conf' >>~/.config/hypr/hyprland.conf

# Ensure custom bash config is sourced
grep -qxF 'source ~/.local/share/omarchy-overrides/default/bash/custom' ~/.bashrc ||
  echo 'source ~/.local/share/omarchy-overrides/default/bash/custom' >>~/.bashrc

# MPV autoload
if [ ! -f "$HOME/.config/mpv/scripts/autoload.lua" ]; then
  echo "Adding mpv autoload script"
  mkdir -p ~/.config/mpv/scripts
  wget -O ~/.config/mpv/scripts/autoload.lua https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autoload.lua
fi
