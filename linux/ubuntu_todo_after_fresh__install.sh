

###########################################
#############  STEP 1
###########################################

# Open "Software and Updates" 
#    -> "Ubuntu Software" -> "Download from" -> "Other" -> "Select Best Server" -> Choose if it says https, else keep clicking select best server

# OR just do 
# Open "Software and Updates" 
#    -> "Ubuntu Software" -> "Download from" -> "Server from US"


# reboot

###########################################
#############  STEP 4
###########################################

# Did basic research of bash vs zsh vs fish and felt like zsh was the right one for me. Also, fish isn't POSIX compliant. bash and zsh are mostly compatible with eash other, but fish isn't.
# sudo apt install zsh

# https://itsfoss.com/zsh-ubuntu/
sudo apt install zsh git fonts-font-awesome
chsh -s $(which zsh) # sets zsh as default
zsh


###########################################
#############  STEP 4
###########################################

# Make terminal beautiful and productive

# oh my zsh 
# starship

# reboot

###########################################
#############  STEP 4
###########################################

# Upgrade kernel
# Do only if necessary
# https://itsfoss.com/upgrade-linux-kernel-ubuntu/
# reboot

###########################################
#############  STEP 2
###########################################

sudo apt update -y && sudo apt upgrade -y

# reboot

###########################################
#############  STEP 1
###########################################

# App Center may have trouble updating snap-store. Do this instead:
ps -e | grep snap-store
kill #paste_process_id_here
sudo snap refresh # updates all snap apps
# sudo snap refresh snap-store
# sudo snap refresh --list 
# sudo snap refresh firefox # update a specific app

###########################################
#############  STEP 4
###########################################

# Install flatpak and enable Flathub
sudo apt install -y gnome-software-plugin-flatpak  flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update # Updates every outdated Flatpak package
# reboot


###########################################
#############  STEP 4
###########################################

# Do this now because Firefox will be neeeded during the installing steps for general searching, version check, etc
# remove snap firefox and install flatpak firefox

sudo snap remove firefox
sudo flatpak install flathub org.mozilla.firefox
flatpak run org.mozilla.firefox

# pin firefox again to Dash/Dock

# Login -> Let it stay open for a while as everything syncs and extensions install

###########################################
#############  STEP 3
###########################################

# Firmware updates using terminal:
# Reference: https://itsfoss.com/update-firmware-ubuntu/
sudo service fwupd start
sudo fwupdmgr refresh
sudo fwupdmgr update


###########################################
#############  STEP 1
###########################################

sudo ubuntu-drivers list
sudo ubuntu-drivers devices  # you can see installed devices and recommended drivers here
# sudo ubuntu-drivers install 
# sudo ubuntu-drivers install nvidia-driver-455 # To install a specific dtiver
sudo ubuntu-drivers autoinstall # Installs all the recommended drivers

# reboot

###########################################
#############  STEP 3
###########################################

# Open "Software Updater" -> Install if anything

# Open "Firmware Updater" -> Install if anything

# Open "Software and Updates" -> "Additional Drivers" -> Choose and apply changes

# Open "App Center" -> Manage -> "Check for Updates" -> "Update Alll"

# Open "Software" app (flatpak/flathub app store) -> update tab -> Install if anything

# reboot

###########################################
#############  STEP 4
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
#############  STEP 3
###########################################

# Find out the latest version first
sudo apt install -y python3.12

# DO NOT DO THE FOLLOWING 
# as ubuntu starts misbehaving when default python is touched
# update-alternatives --list python3
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 2


###########################################
#############  STEP 3
###########################################

# Install Java?
# Install only if necessary - find the latest first
# apt search openjdk
sudo apt install -y openjdk-22-jdk

###########################################
#############  STEP 4
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
#############  STEP 4
###########################################

# Install jetbrains toolbox

# Follow instructions here: https://www.jetbrains.com/help/pycharm/installation-guide.html
# May need to run the following if opening toolbox app gives error:
# sudo apt install -y libfuse2
# Install Pycharm later below


###########################################
#############  STEP 4
###########################################

# Commonly used media codecs and fonts for Ubuntu
# Need to click ok and then yes manually
sudo apt install -y ubuntu-restricted-extras


# Commonly used restricted packages for Ubuntu
sudo apt install -y ubuntu-restricted-addons


###########################################
#############  STEP 4
###########################################

# Enable Advanced Window Tiling - not needed anymore in latest ubuntu
# sudo apt install gnome-shell-extension-ubuntu-tiling-assistant
# Reboot

# Next step in Settings section explained below

###########################################
#############  STEP 4
###########################################

# Install GNOME Tweaks

# Open "App Center" -> Search "GNOME Tweaks" and install "GNOME Tweaks" by "The GNOME Project"

# Settings within it are explained below


###########################################
#############  STEP 4
###########################################

# Install useful software


sudo apt install -y git
sudo apt install -y htop

# vscode

# Useful to check system info in cool way
sudo apt install -y neofetch

# Only for laptop - Improve Laptop Battery:
# sudo apt install -y tlp tlp-rdw
# sudo tlp start


# Install VLC 
sudo apt install -y vlc
# Can also nstall VLC from "Apps Center"
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
sudo systemctl enable ufw
sudo systemctl start ufw
# optionally do following instead of systemctl
# sudo ufw enable

# Run Windows applications on ubuntu - can use actual *.exe files
flatpak install flathub com.usebottles.bottles
flatpak run com.usebottles.bottles

# KDE Connect
# find out

# Install any of the following as needed
# sudo apt install -y gimp gparted cargo curl wget unrar unzip 
# sudo apt install -y libreoffice kdenlive simplescreenrecorder stacer



###########################################
#############  STEP 4
###########################################

# Gaming

# Install Steam
# Steam -> Settings -> Steam Play -> Enable "Enable Steam Play for supported titles"
# Steam -> Settings -> Steam Play -> Enable "Enable Steam Play for all other titles"
# Steam -> Settings -> Steam Play -> Select the latest proton version from drop down


###########################################
#############  STEP 4
###########################################

Privacy 
- disable diagnostic data, etc in OS as well as apps

###########################################
#############  STEP 4
###########################################

# Enable "Minimize on Dock icon click"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

###########################################
#############  STEP 4
###########################################

##### Settings

# Network -> Click the gear box next to the connection in use -> IPV4 tab -> Disable "Automatic" for DNS -> Paste the following in the box and apply:
# 8.8.8.8, 1.1.1.1, 8.8.4.4, 1.0.0.1

# Network -> Click the gear box next to the connection in use -> IPV6 tab -> "Additional DNS servers" -> Paste the following in the box and apply:
# 2001:4860:4860::8888, 2001:4860:4860::8844, 2606:4700:4700::1111, 2606:4700:4700::1001

# Appearance -> choose dark/light mode and background. Also choose color that matches the background

# Ubuntu Desktop -> Desktop Icons -> Size = Small, Enable "Show Personal Folder"
# Ubuntu Desktop -> Dock -> disable "Panel Mode", set icon size to around 30, "Position on screen = bottom"

# Ubuntu Desktop -> Enhanced Tiling -> Enable

# Search -> Search Results -> Disable everything except Settings and Software

# Privacy -> Screen Lock -> Adujst to liking, 
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

###########################################
#############  STEP 4
###########################################
# App specific settings:


##### Firefox:

# about:config
# layers.acceleration.force-enabled -> toggle to true
# gfx.webrender.all -> toggle to true

# UI Settings:
# General -> Startup -> enable "open previous windows and tabs"
# General -> Performance -> Enable "Use Hardware acceleration when available" and enable "Use recommended performance settings"
# General -> ebable "Play DRM-controlled content" (find out whats this first)




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
# Terminal -> Preferences -> Profies (unnamed) -> Colors -> disable "Use Transparency from System Theme" -> Enable "Use Transparent Background" and set it to around 5%


##### Calendar
# Open it and let it sync for a while

##### Files
# Preferences -> General -> Enable "Expandable Folders in List view"

##### Chrome or Chromium
# Open Chrome and disable diagnostics


###########################################
#############  STEP 4
###########################################

# Open app "Startup Applications" -> Check if alright

###########################################
#############  STEP 4
###########################################

# Clean up - the following won't install anything btw
sudo apt-get -y autoclean
sudo apt-get -y autoremove
sudo apt-get -y clean

###########################################
#############  STEP 4
###########################################

# reboot

# Setup Backup
# Do this step after setting up online accounts - google/microsoft if you want drive/onedrive options

# Open Backups app -> Configure and run backup with google drive as destination
# Use backups app for online backup

# Use timeshift for offline backup that you could restore or rollback to in case of any problem
# Installed above already
# open timeshift app, configure and run backup






