# Git
abbr -a g git
abbr -a ga 'git add'
abbr -a gaa 'git add --all'
abbr -a gcl 'git clone'
abbr -a gc 'git commit'
abbr -a gcm 'git commit -m'
abbr -a gcam 'git commit -a -m'
abbr -a gd 'git diff'
abbr -a gf 'git fetch'
abbr -a gp 'git push'
abbr -a gl 'git pull'
abbr -a gst 'git status'
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a glog 'git log --oneline --decorate'
abbr -a glogy 'git log --since='yesterday.midnight' --until='midnight' --all --no-merges --oneline --author=saull@outlook.com'

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

# Tools
alias n='nvim'

# Find packages without leaving the terminal
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
