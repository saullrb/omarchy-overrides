echo "Updating config symlinks..."
CONFIG_DIR="$HOME/.local/share/omarchy-overrides/config"

for dir in "$CONFIG_DIR"/*/; do
  if [ -d "$dir" ]; then
    dir_name=$(basename "$dir")
    target_dir="$HOME/.config/$dir_name"
    mkdir -p "$target_dir"
    for file in "$dir"*; do
      filename=$(basename "$file")
      target_file="$target_dir/$filename"
      [ -e "$target_file" ] && rm -rf "$target_file"
      ln -s "$file" "$target_file"
    done
  fi
done
