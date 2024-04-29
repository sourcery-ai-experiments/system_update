
# Refer this for latest instructions: https://flathub.org/setup/Ubuntu
# Install flatpak and enable Flathub
sudo apt install -y gnome-software-plugin-flatpak flatpak
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# https://flathub.org/
flatpak update # Updates every outdated Flatpak package
# reboot


# Firefox:
sudo flatpak install flathub org.mozilla.firefox
# flatpak run org.mozilla.firefox

# VSCodium
sudo flatpak install flathub com.vscodium.codium # install it
# flatpak run com.vscodium.codium # run it
# sudo flatpak uninstall com.vscodium.codium # uninstall it

# Pycharm
sudo flatpak install -y flathub com.jetbrains.PyCharm-Community
# flatpak run com.jetbrains.PyCharm-Community

# Tor Browser
sudo flatpak install tor-browser

# Spotify
flatpak install -y flathub com.spotify.Client

# bottles
# Run Windows applications on ubuntu - can use actual *.exe files
# flatpak install -y flathub com.usebottles.bottles
# flatpak run com.usebottles.bottles

# PlayOnLinux
flatpak install -y flathub com.playonlinux.PlayOnLinux4