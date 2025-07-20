function compress
    tar -czf (string replace -r '/$' '' $argv[1]).tar.gz (string replace -r '/$' '' $argv[1])
end

alias decompress="tar -xzf"

function web2app
    if test (count $argv) -ne 3
        echo "Usage: web2app <AppName> <AppURL> <IconURL>"
        return 1
    end

    set APP_NAME $argv[1]
    set APP_URL $argv[2]
    set ICON_URL $argv[3]
    set ICON_DIR "$HOME/.local/share/applications/icons"
    set DESKTOP_FILE "$HOME/.local/share/applications/$APP_NAME.desktop"
    set ICON_PATH "$ICON_DIR/$APP_NAME.png"

    mkdir -p "$ICON_DIR"

    if not curl -sL -o "$ICON_PATH" "$ICON_URL"
        echo "Error: Failed to download icon."
        return 1
    end

    printf "[Desktop Entry]\nVersion=1.0\nName=$APP_NAME\nComment=$APP_NAME\nExec=chromium --new-window --ozone-platform=wayland --app=\"$APP_URL\" --name=\"$APP_NAME\" --class=\"$APP_NAME\"\nTerminal=false\nType=Application\nIcon=$ICON_PATH\nStartupNotify=true\n" >"$DESKTOP_FILE"

    chmod +x "$DESKTOP_FILE"
end

function web2app-remove
    if test (count $argv) -ne 1
        echo "Usage: web2app-remove <AppName>"
        return 1
    end

    set APP_NAME $argv[1]
    set ICON_DIR "$HOME/.local/share/applications/icons"
    set DESKTOP_FILE "$HOME/.local/share/applications/$APP_NAME.desktop"
    set ICON_PATH "$ICON_DIR/$APP_NAME.png"

    rm "$DESKTOP_FILE"
    rm "$ICON_PATH"
end

function refresh-xcompose
    pkill fcitx5
    uwsm app -- fcitx5 >/dev/null 2>&1 &
end
