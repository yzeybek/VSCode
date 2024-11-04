#!/usr/bin/bash

tar -xzf ~/Downloads/code-stable-x64-*.tar.gz -C ~/snap/

cp ~/VSCode/icon.png ~/snap/VSCode-linux-x64/icon.png

USER=$(whoami)

echo "[Desktop Entry]
Name=VSCode
Comment=Programming Text Editor
Exec=/home/$USER/snap/VSCode-linux-x64/code
Icon=/home/$USER/snap/VSCode-linux-x64/icon.png
Terminal=false
Type=Application
Categories=Development" > ~/.local/share/applications/VSCode.desktop

update-desktop-database ~/.local/share/applications

echo "alias code='/home/$USER/snap/VSCode-linux-x64/code'" >> ~/.zshrc
echo "alias code='/home/$USER/snap/VSCode-linux-x64/code'" >> ~/.bashrc

source ~/.bashrc
source ~/.zshrc
