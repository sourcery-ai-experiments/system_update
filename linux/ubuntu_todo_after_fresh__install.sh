

###########################################
###########################################

# Open "Software and Updates" 
#    -> "Ubuntu Software" -> "Download from" -> "Other" -> "Select Best Server" -> Choose if it says https, else keep clicking select best server

# OR just do 
# Open "Software and Updates" 
#    -> "Ubuntu Software" -> "Download from" -> "Server from US"


# reboot

###########################################
###########################################

##### SHELL

# Did basic research of bash vs zsh vs fish and felt like zsh was the right one for me. Also, fish isn't POSIX compliant. bash and zsh are mostly compatible with eash other, but fish isn't.
# sudo apt install zsh

# https://itsfoss.com/zsh-ubuntu/
sudo apt install -y zsh fonts-font-awesome
chsh -s $(which zsh) # sets zsh as default
zsh


###########################################
###########################################

##### TERMINAL EMULATORS - Alacritty, Kitty, Konsole, Terminator, XTerm,
sudo apt install alacritty


###########################################
###########################################

##### Make terminal beautiful and productive

##### oh my zsh - https://ohmyz.sh/
sudo apt install git wget curl xclip autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configuring oh-my-zsh:



# Interesting Built-in plugins:
# debian, systemd, aliases, colored-man-pages, colorize, command-not-found, cp, rsync, safe-paste, screen, rbw, autojump, github, git, gitignore, postgres, redis-cli, golang, docker, repo, pip, python, pyenv, virtualenv, autopep8, pylint,  themes,

##### starship

sudo snap install starship
# open bash config
gedit .bashrc # change to zshrc for zsh
# Scroll to bottom and paste:
# eval "$(starship init bash)"
# save and close gedit
# close and open terminal and it'll have starship formatting
# change color scheme of starship
# draculatheme.com gnome theme # search this
# also get their gtk theme and gedit theme and icon theme
# Follow instructions on their website
# Use Gnome-Tweaks -> Appearance -> Choose individual themesf







# reboot



###########################################
###########################################

# Upgrade kernel
# Do only if necessary
# https://itsfoss.com/upgrade-linux-kernel-ubuntu/
# reboot

###########################################
###########################################

sudo apt update -y && sudo apt upgrade -y

# reboot

###########################################
###########################################

# App Center may have trouble updating snap-store. Do this instead:
ps -e | grep snap-store
kill #paste_process_id_here
sudo snap refresh # updates all snap apps
# sudo snap refresh snap-store
# sudo snap refresh --list 
# sudo snap refresh firefox # update a specific app

###########################################
###########################################

# Refer this for latest instructions: https://flathub.org/setup/Ubuntu
# Install flatpak and enable Flathub
sudo apt install -y gnome-software-plugin-flatpak  flatpak
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# https://flathub.org/
flatpak update # Updates every outdated Flatpak package
# reboot

###########################################
###########################################

# Do this now because Firefox will be needed during the installing steps for general searching, version check, etc
# remove snap firefox and install flatpak firefox

sudo snap remove firefox
sudo flatpak install flathub org.mozilla.firefox
flatpak run org.mozilla.firefox

# pin firefox again to Dash/Dock

# Login -> Let it stay open for a while as everything syncs and extensions install

###########################################
###########################################

# Firmware updates using terminal:
# Reference: https://itsfoss.com/update-firmware-ubuntu/
sudo service fwupd start
sudo fwupdmgr refresh
sudo fwupdmgr update


###########################################
###########################################

sudo ubuntu-drivers list
sudo ubuntu-drivers devices  # you can see installed devices and recommended drivers here
# sudo ubuntu-drivers install 
# sudo ubuntu-drivers install nvidia-driver-455 # To install a specific dtiver
sudo ubuntu-drivers autoinstall # Installs all the recommended drivers

# reboot

###########################################
###########################################

# Open "Software Updater" -> Install if anything

# Open "Firmware Updater" -> Install if anything

# Open "Software and Updates" -> "Additional Drivers" -> Choose and apply changes

# Open "App Center" -> Manage -> "Check for Updates" -> "Update All"

# Open "Software" app (flatpak/flathub app store) -> update tab -> Install if anything

# reboot

###########################################
###########################################
# Gnome extensions
sudo apt install -y gnome-shell-extension-manager
sudo apt install -y gnome-browser-connector
# Go to https://extensions.gnome.org -> Install browder extension suggested

# Can also be installed using "App Center" -> Search "GNOME Extensions" and install "Extension Manager" by Matthew Jakeman

# Open "Extension Manager" 
# Browse and install the following:
#    User Themes
#    blur my shell

###########################################
###########################################

# Find out the latest version first
sudo apt install -y python3.12

# DO NOT DO THE FOLLOWING 
# as ubuntu starts misbehaving when default python is touched
# update-alternatives --list python3
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 2


###########################################
###########################################

# Install Java?
# Install only if necessary - find the latest first
# apt search openjdk
sudo apt install -y openjdk-22-jdk

###########################################
###########################################

# Install vscode
# Documentation: https://code.visualstudio.com/docs/setup/linux 

sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code # or code-insiders

###########################################
###########################################

# Install jetbrains toolbox

# Follow instructions here: https://www.jetbrains.com/help/pycharm/installation-guide.html
# May need to run the following if opening toolbox app gives error:
# sudo apt install -y libfuse2
# Install Pycharm later below


###########################################
###########################################

# Commonly used media codecs and fonts for Ubuntu
# Need to click ok and then yes manually
sudo apt install -y ubuntu-restricted-extras


# Commonly used restricted packages for Ubuntu
sudo apt install -y ubuntu-restricted-addons

# Install some fonts
sudo apt install fonts-jetbrains-mono

###########################################
###########################################

# Enable Advanced Window Tiling - not needed anymore in latest ubuntu
# sudo apt install gnome-shell-extension-ubuntu-tiling-assistant
# Reboot

# Next step in Settings section explained below

###########################################
###########################################

# Install GNOME Tweaks

# Open "App Center" -> Search "GNOME Tweaks" and install "GNOME Tweaks" by "The GNOME Project"

# Settings within it are explained below


###########################################
###########################################

# Install useful software

sudo apt install -y unattended-upgrades # Configurations in settings section

sudo apt install -y git

# Github
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

sudo apt install -y htop

# vscode

# Useful to check system info in cool way
sudo apt install -y neofetch

# Install tor browser
sudo apt install tor torbrowser-launcher

# Only for laptop - Improve Laptop Battery:
# sudo apt install -y tlp tlp-rdw
# sudo tlp start


# Install VLC 
sudo apt install -y vlc
# Can also install VLC from "Apps Center"
# Remove the gnome video player to remove redundancy
sudo apt remove totem


# Download and install google chrome from their website
# For better privacy, install chromium instead
# Select "64 bit .deb" and click "accept and install"
# Once downloaded, open terminal in the download folder and run the following (replace filename if different):
# sudo dpkg -i google_chrome_stable_current_amd64.deb
sudo apt install chromium-browser


# Preloads most used apps in RAM for quick reaction times
sudo apt install -y preload 

# Configurations in last section
sudo apt install -y timeshift


# Synaptic Package Manager - apt based package manager
sudo apt install -y synaptic:

# Bleachbit -> System cleaner
# Open as root
# Run if PC feels slow
sudo apt install -y bleachbit

# Can install Spotify using apt or flatpak. Flatpak example below
flatpak install -y flathub com.spotify.Client

# Firewall
sudo apt install -y ufw

# Run Windows applications on ubuntu - can use actual *.exe files
flatpak install flathub com.usebottles.bottles
flatpak run com.usebottles.bottles

# KDE Connect
# find out

# Some network stuff
sudo apt install -y net-tools
sudo apt install -y nmap # https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
sudo snap install nutty

# Install any of the following as needed
# sudo apt install -y gimp gparted cargo curl wget unrar unzip 
# sudo apt install -y libreoffice kdenlive simplescreenrecorder stacer



###########################################
###########################################

# Gaming

# Install Steam
# Steam -> Settings -> Steam Play -> Enable "Enable Steam Play for supported titles"
# Steam -> Settings -> Steam Play -> Enable "Enable Steam Play for all other titles"
# Steam -> Settings -> Steam Play -> Select the latest proton version from drop down




###########################################
###########################################

# Enable "Minimize on Dock icon click"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

###########################################
###########################################

##### Settings

# Network -> Click the gear box next to the connection in use -> IPV4 tab -> Disable "Automatic" for DNS -> Paste the following in the box and apply:
# 8.8.8.8, 1.1.1.1, 8.8.4.4, 1.0.0.1

# Network -> Click the gear box next to the connection in use -> IPV6 tab -> "Additional DNS servers" -> Paste the following in the box and apply:
# 2001:4860:4860::8888, 2001:4860:4860::8844, 2606:4700:4700::1111, 2606:4700:4700::1001

# Network -> Click the gear box next to the connection in use -> IPV6 tab -> "IPV6 Method" = Disabled (reduce attack surface area unless explicitly needed)

# Appearance -> choose dark/light mode and background. Also choose color that matches the background

# Ubuntu Desktop -> Desktop Icons -> Size = Small, Enable "Show Personal Folder"
# Ubuntu Desktop -> Dock -> disable "Panel Mode", set icon size to around 20, "Position on screen = bottom"

# Ubuntu Desktop -> Enhanced Tiling -> Enable

# Search -> Search Results -> Disable everything except Settings and Software

# Privacy -> Screen Lock -> Adjust to liking,
# Privacy -> disable "Location Services"
# Privacy -> Diagnostics -> Never


# Online Accounts - Add whatever accounts I want to sync. Adding google shows Google Drive in Files

# Sharing -> Set "Device Name"

# Power -> Show Battery Percentage -> enable (For laptop)
# Power -> Choose "performance" power mode, screen blank to lot more minutes, automatic suspend off

# Displays -> Night Light -> Enable

# Mouse & Touchpad -> Increase Pointer speed to around 75%

# Users -> Choose user image

# Default Apps - check and set

# Date and Time - Set time format to AM/PM


##### GNOME Tweaks

# Top Bar -> Enable Seconds, Weekday

#################################3


###########################################
###########################################

# Privacy and Security
#- disable diagnostic data, etc in OS as well as apps

# UFW
# Recommended rules from https://christitus.com/linux-security-mistakes/
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
# Enable ufw
sudo ufw enable
#sudo systemctl enable ufw # Didn't work for some reason
#sudo systemctl start ufw # Didn't work for some reason


# AppArmor
# https://ubuntu.com/server/docs/security-apparmor
sudo apt install apparmor-profiles
sudo apparmor_status
# sudo systemctl reload apparmor.service
sudo systemctl enable apparmor.service
sudo systemctl start apparmor.service



# TOR Network (Tor browser is different)
source torsocks on
echo ". torsocks on" >> ~/.bashrc
echo ". torsocks on" >> ~/.zshrc
# source torsocks off #  toggle torsocks mode off again
# TODO - Refer this for configuring tor network next steps - https://linuxconfig.org/install-tor-proxy-on-ubuntu-20-04-linux
# Also refer https://help.ubuntu.com/community/Tor
# https://community.torproject.org/relay/setup/bridge/debian-ubuntu/


###########################################
###########################################
# App specific settings:


##### Firefox:

# about:config
# layers.acceleration.force-enabled -> toggle to true
# gfx.webrender.all -> toggle to true

# UI Settings:
# General -> Startup -> enable "open previous windows and tabs"
# General -> Performance -> Enable "Use Hardware acceleration when available" and enable "Use recommended performance settings"
# General -> enable "Play DRM-controlled content" (find out whats this first)

# Ublock Origin - Enable relevant filters

##### Tor Browser
# Open "Tor Browser Launcher Settings" app -> enable "Download over System Tor"
# Open "Tor Browser" app -> It will download and install


##### Jetbrains Toolbox
# login to the toolbox app
# Toolbox -> Settings -> Enable auto update
# Toolbox -> Install Pycharm Community
# Toolbox -> Pycharm Community Settings -> Auto update, larger memory 


##### pycharm

# set latest python as interpreter


##### vscode

# set latest python as interpreter


##### Firefox:
# Login

# Privacy

# General -> Language and appearance -> Choose dark/light to Automatic 


##### Terminal
# Terminal -> Preferences -> Profiles (unnamed) -> Colors -> disable "Use Transparency from System Theme" -> Enable "Use Transparent Background" and set it to around 5%


##### Calendar
# Open it and let it sync for a while

##### Files
# Preferences -> General -> Enable "Expandable Folders in List view"

##### Chrome or Chromium
# Open Chrome and disable diagnostics


###########################################
###########################################

# Open app "Startup Applications" -> Check if alright


# For apps that you want to delay startup, append "sleep" <space> <seconds> <semicolon> before the existing command there
# Example: Change the following in command box for jetbrains toolbox startup entry:
# /home/nbhirud/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize
# To the following
# sleep 60;/home/nbhirud/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize
# This did not work - find out why

###########################################
###########################################

# Clean up - the following won't install anything btw
sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y clean

###########################################
###########################################

# reboot

# Setup Backup
# Do this step after setting up online accounts - google/microsoft if you want drive/onedrive options

# Open Backups app -> Configure and run backup with google drive as destination
# Use backups app for online backup

# Use timeshift for offline backup that you could restore or rollback to in case of any problem
# Installed above already
# open timeshift app, configure and run backup


###########################################
###########################################

# TODO - Some commands and tools to read about
# sudo apt dist-upgrade
# SELinux
# clamav and clamtk
# Safing Portmaster
# Tails OS - portable persistant OS from USB for library
# Obfuscate for quickly hiding parts or writing on images

