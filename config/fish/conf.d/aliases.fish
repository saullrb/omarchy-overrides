# Zoxide
function zd
    if test (count $argv) -eq 0
        builtin cd ~
    else if test -d $argv[1]
        builtin cd $argv[1]
    else
        z $argv; and printf " \U000F17A9 "; and pwd; or echo "Error: Directory not found"
    end
end

# File system
alias cd='zd'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Find packages without leaving the terminal
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
