#!/usr/bin/bash

tar -xzf ~/Downloads/code-stable-x64-*.tar.gz -C ~/snap/

cp ~/Ubuntu-VSCode/icon.png ~/snap/VSCode-linux-x64/icon.png

USER=$(whoami)

echo "[Desktop Entry]
Name=VSCode
Comment=Programming Text Editor
Exec=/home/$USER/snap/VSCode-linux-x64/code
Icon=/home/$USER/snap/VSCode-linux-x64/icon.png
Terminal=false
Type=Application
Categories=Development" > ~/.local/share/applications/Ubuntu-VSCode.desktop

chmod +x ~/.local/share/applications/Ubuntu-VSCode.desktop

update-desktop-database ~/.local/share/applications

current_favorites=$(gsettings get org.gnome.shell favorite-apps)

current_favorites_cleaned=$(echo "$current_favorites" | sed "s/^\[//" | sed "s/\]//")

new_favorites="$current_favorites_cleaned, 'Ubuntu-VSCode.desktop'"

new_favorites_wrapped="[$new_favorites]"

gsettings set org.gnome.shell favorite-apps "$new_favorites_wrapped"

echo "alias code='/home/$USER/snap/VSCode-linux-x64/code'" >> ~/.zshrc
echo "alias code='/home/$USER/snap/VSCode-linux-x64/code'" >> ~/.bashrc

rm -rf ~/Ubuntu-VSCode ~/Downloads/code-stable-x64-*-tar.gz

source ~/.bashrc
source ~/.zshrc
