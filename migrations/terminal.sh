if ! command -v starship &>/dev/null; then
    echo "Installing starship"
    yay -S --noconfirm --needed starship
fi

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
