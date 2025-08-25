echo "Installing some apps"

source ~/.local/share/omarchy/default/bash/functions

if [ ! -f "$HOME/.local/share/applications/YouTube Music.desktop" ]; then
  echo "Adding YouTube Music webapp"
  web2app "YouTube Music" https://music.youtube.com https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube-music.png
fi

if [ ! -f "$HOME/.local/share/applications/Discord.desktop" ]; then
  echo "Adding Discord webapp"
  web2app Discord https://discord.com/app https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/discord.png
fi

if [ ! -f "$HOME/.local/share/applications/Proton Mail.desktop" ]; then
  echo "Adding Proton Mail webapp"
  web2app 'Proton Mail' https://mail.proton.me https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/proton-mail.png
fi
