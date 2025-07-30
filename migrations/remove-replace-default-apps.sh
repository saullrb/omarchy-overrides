echo "Removing/Replacing some apps"
source ~/.local/share/omarchy/default/bash/functions

web2app-remove "Basecamp" 2>/dev/null
web2app-remove "GitHub" 2>/dev/null
web2app-remove "Google Contacts" 2>/dev/null
web2app-remove "Google Messages" 2>/dev/null
web2app-remove "Google Photos" 2>/dev/null
web2app-remove "HEY" 2>/dev/null
web2app-remove "X" 2>/dev/null

if command -v spotify &>/dev/null; then
    echo "Replacing Spotify with Youtube Music webapp..."
    yay -Rns --noconfirm spotify
    web2app "YouTube Music" https://music.youtube.com https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube-music.png
fi

if [ ! -f "$HOME/.local/share/applications/Discord.desktop" ]; then
    echo "Adding Discord webapp"
    web2app Discord https://discord.com/app https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/discord.png
fi

if [ -f "$HOME/.local/share/applications/YouTube.desktop" ]; then
    echo "Removing YouTube webapp"
    web2app-remove YouTube
fi

if [ ! -f "$HOME/.local/share/applications/Proton Mail.desktop" ]; then
    echo "Adding Proton Mail webapp"
    web2app 'Proton Mail' https://mail.proton.me https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/proton-mail.png
fi

if command -v op &>/dev/null; then
    echo "Removing 1password"
    yay -Rns --noconfirm 1password-cli 1password-beta
fi

if command -v xournalpp &>/dev/null; then
    echo "Removing Xournal++..."
    yay -Rns --noconfirm xournalpp
fi

if command -v typora &>/dev/null; then
    echo "Removing Typora..."
    yay -Rns --noconfirm typora
fi

if command -v signal-desktop &>/dev/null; then
    echo "Removing Signal..."
    yay -Rns --noconfirm signal-desktop
fi

if command -v zoom &>/dev/null; then
    echo "Removing zoom..."
    yay -Rns --noconfirm zoom

    if [ -f "$HOME/.local/share/applications/Zoom.desktop" ]; then
        rm "$HOME/.local/share/applications/Zoom.desktop"
    fi
fi
