if status is-interactive
    source ~/.config/fish/functions/functions.fish

    zoxide init fish | source
    starship init fish | source
end
