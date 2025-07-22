if [ ! -f "$HOME/.config/mpv/scripts/autoload.lua" ]; then
  echo "Adding mpv autoload script"
  mkdir -p ~/.config/mpv/scripts
  wget -O ~/.config/mpv/scripts/autoload.lua https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autoload.lua
fi
