
## Notes:
# The following steps were written based on Ubuntu 24.04 (Dev) x86_64

###########################################
###########################################

# Open "Software and Updates" 
#    -> "Ubuntu Software" -> "Download from" -> "Other" -> "Select Best Server" -> Choose if it says https, else keep clicking select best server

# OR just do 
# Open "Software and Updates" 
#    -> "Ubuntu Software" -> "Download from" -> "Server from US" if you are in US

# reboot

###########################################
###########################################

# Get this repo
which git || sudo apt install git # check if a package is already installed to avoid unnecessary operations
mkdir -p CodeProjects
cd CodeProjects
git clone https://github.com/nbhirud/system_update.git
gedit system_update/linux/ubuntu/ubuntu_todo_after_fresh_install.sh

###########################################
###########################################

##### Fonts setup early to make zsh look good from beginning (needs nerd fonts)

# Commonly used media codecs and fonts for Ubuntu
# Need to click ok and then yes manually
sudo apt install -y ubuntu-restricted-extras

# Commonly used restricted packages for Ubuntu
sudo apt install -y ubuntu-restricted-addons

# Install some fonts
# sudo apt install fonts-jetbrains-mono # Covered by nerd-fonts below, so skip this

# https://needforbits.wordpress.com/2017/07/19/install-microsoft-windows-fonts-on-ubuntu-the-ultimate-guide/
sudo apt install ttf-mscorefonts-installer # Windows Core fonts (2007) like Arial, Times New Roman, etc
wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash # Installs Microsoft’s ClearType fonts (Windows Vista Fonts) like Calibri, Consolas, etc
wget https://gist.githubusercontent.com/maxwelleite/913b6775e4e408daa904566eb375b090/raw/cbfd8eb70184fa509fcab37dad7905676c93d587/ttf-ms-tahoma-installer.sh -q -O - | sudo bash # Install Tahoma fonts
# install the full pack of Segoe UI fonts
sudo mkdir -p /usr/share/fonts/truetype/msttcorefonts/
cd /usr/share/fonts/truetype/msttcorefonts/
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeui.ttf?raw=true -O segoeui.ttf # regular
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuib.ttf # bold
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuii.ttf # italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuiz.ttf?raw=true -O segoeuiz.ttf # bold italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuil.ttf?raw=true -O segoeuil.ttf # light
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguili.ttf?raw=true -O seguili.ttf # light italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuisl.ttf?raw=true -O segoeuisl.ttf # semilight
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisli.ttf?raw=true -O seguisli.ttf # semilight italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisb.ttf?raw=true -O seguisb.ttf # semibold
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisbi.ttf?raw=true -O seguisbi.ttf # semibold italic
fc-cache -f /usr/share/fonts/truetype/msttcorefonts/
# WPS Office Fonts (Symbol fonts) - Will install them here: /usr/share/fonts/wps-fonts
cd /tmp
wget -O ttf-wps-fonts-master.zip https://github.com/IamDH4/ttf-wps-fonts/archive/master.zip
unzip -LL ttf-wps-fonts-master.zip
cd ttf-wps-fonts-master
sudo ./install.sh

# Also install these:
# https://github.com/ryanoasis/nerd-fonts
# https://github.com/powerline/fonts

cd ~/Downloads
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git

# JetBrainsMono
# Meslo
# Hack
# RobotoMono
# SourceCodePro
# FiraCode
# Noto
# Inconsolata
# CascadiaCode
# MartianMono
# Copy above folders from patched-fonts dir into a new directory called "nerd_fonts" -> Delete all files that are
# not either *.ttf or *.otf -> move the nerd_fonts directory to ~/.local/share/fonts

# To delete unnecessary files, run the following:
# find . -name "*.md" -type f -delete
# find . -name "*.txt" -type f -delete
# find . -name "LICENSE" -type f -delete
# But first verify without the -delete option like following:
find . -name "*.bak" -type f

fc-cache -fr # clear font cache
# sudo fc-cache -f -v # Find out difference
fc-list | grep "JetBrains" # To check if jetbrains fond was installed successfully

# ~/config/fontconfig/fonts.conf # Did not find this. Use GNOME Tweaks app instead
# set multiple <family> tags with different font families under <prefer> section
# This is a way to set preferred font and fall-back fonts

###########################################
###########################################

##### SHELL
echo $SHELL # To check current shell
# Did basic research of bash vs zsh vs fish and felt like zsh was the right one for me. Also, fish isn't POSIX
# compliant. bash and zsh are mostly compatible with each other, but fish isn't.
# sudo apt install zsh

# https://itsfoss.com/zsh-ubuntu/
sudo apt install -y zsh fonts-font-awesome
chsh -s $(which zsh) # sets zsh as default
zsh
# Looks like restarting terminal doesn't apply this change of default shell. But seems to work after a reboot.

###########################################
###########################################

##### TERMINAL EMULATORS - Alacritty, Kitty, Konsole, Terminator, XTerm,
#sudo apt install alacritty # Default console is good enough for my current usage

###########################################
###########################################

##### Make terminal beautiful and productive

# Step 1 - If not already done, set nerd fonts as default in "GNOME Tweaks", "GNOME Terminal -> unnamed",

##### oh my zsh - https://ohmyz.sh/
# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
sudo apt install wget curl xclip autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configuring oh-my-zsh:
nano .zshrc
ZSH_THEME="agnoster" # (this is one of the fancy ones)



# Interesting Built-in plugins:
# debian, systemd, aliases, colored-man-pages, colorize,
# command-not-found, cp, rsync, safe-paste, screen, rbw,
# autojump, github, git, gitignore, postgres, redis-cli,
# golang, docker, repo, pip, python, pyenv, virtualenv,
# autopep8, pylint,  themes, sudo, history, JsonTools
# you-should-use, Auto-Notify,
# zsh-autosuggestions, zsh-syntax-highlighting

# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file#configuration

# https://github.com/zsh-users/zsh-syntax-highlighting

# TLDR:
cd $ZSH_CUSTOM/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# oh-my-zsh config:
#cd
#nano .zshrc
## do the following changes:
## ZSH_THEME="robbyrussell" # comment this line
#ZSH_THEME="agnoster"
#zstyle ':omz:update' mode auto # Uncomment this
#zstyle ':omz:update' frequency 7 # Uncomment and change value
#ENABLE_CORRECTION="true" # Uncomment - Give it a try
#COMPLETION_WAITING_DOTS="true"
#plugins=(git sudo debian safe-paste screen autojump github postgres docker pip python poetry repo themes zsh-autosuggestions zsh-syntax-highlighting)
## At the bottom of oh-my-zsh stuff:
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
#ZSH_AUTOSUGGEST_STRATEGY=(history completion match_prev_cmd)
#ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets pattern cursor)

omz update
# Reloads the updated terminal theme
source ~/.zshrc

######################################################################
##### starship
# Skip this. omz feels more helpful after trying both.

#sudo snap install starship
# Add the following to the end of ~/.bashrc:
#eval "$(starship init bash)"
echo "$(starship init bash)" >> ~/.bashrc
# Add the following to the end of ~/.zshrc:
# eval "$(starship init zsh)"

# open bash config
gedit .bashrc # change to zshrc for zsh
# Scroll to bottom and paste:
# eval "$(starship init bash)"
# save and close gedit
# close and open terminal and it'll have starship formatting
# change color scheme of starship

# Reloads the updated terminal theme
source ~/.zshrc
source ~/.bashrcf
# reboot

#########################

# Themes - Liked dracula more

# # draculatheme.com gnome theme # search this
# # also get their gtk theme and gedit theme and icon theme
# # Follow instructions on their website
# https://draculatheme.com/gtk
# https://draculatheme.com/gedit
# https://draculatheme.com/visual-studio-code
# https://draculatheme.com/gimp
# https://draculatheme.com/chrome
# https://draculatheme.com/firefox
# https://draculatheme.com/alacritty
# https://draculatheme.com/jetbrains
# https://draculatheme.com/jupyter-notebook
# https://draculatheme.com/jupyterlab
# https://draculatheme.com/duckduckgo
# https://draculatheme.com/spyder-ide

# # Not for PC
# https://draculatheme.com/github

# # Non Essential:
# https://draculatheme.com/libreoffice
# https://draculatheme.com/youtube
# https://draculatheme.com/grub
# https://draculatheme.com/google-calendar
# https://draculatheme.com/stackoverflow

# # Don't use with omz
# https://draculatheme.com/zsh-syntax-highlighting
# https://draculatheme.com/git
# https://draculatheme.com/gnome-terminal
# https://draculatheme.com/zsh


# Nordic Theme - https://www.pling.com/p/1267246/
#gsettings set org.gnome.desktop.interface gtk-theme Nordic
#gsettings set org.gnome.desktop.wm.preferences theme Nordic

# # Use Gnome-Tweaks -> Appearance -> Choose individual themes to set these themes.
# Fonts:
# Interface Text = Ubuntu Nerd Font Regular
# Document Text = JetBrainsMono Nerd Font Regular
# Monospace Text = JetBrainsMono Nerd Font Mono Regular
# reboot

###########################################
###########################################

# fig.io
# Another cool tool, but probably don't install it with omz or starship

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
sudo apt install -y gnome-software-plugin-flatpak flatpak
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
# sudo service fwupd start
# sudo fwupdmgr refresh # didn't work on UEFI, but worked on Legacy
# sudo fwupdmgr update # didn't work on UEFI, but worked on Legacy
if [ -d /sys/firmware/efi ]; then
    echo "UEFI mode detected. Skipping fwupdmgr refresh and update."
else
    echo "Legacy BIOS mode detected. Starting fwupd service and performing refresh and update."
    sudo service fwupd start
    sudo fwupdmgr refresh
    sudo fwupdmgr update
fi
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
gnome-shell --version
# sudo apt install -y gnome-shell-extensions
sudo apt install -y gnome-shell-extension-manager
sudo apt install -y gnome-browser-connector
# sudo apt install chrome-gnome-shell
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
sudo pip install --upgrade pip

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

## Install vscode
## Documentation: https://code.visualstudio.com/docs/setup/linux
# sudo apt install -y wget gpg
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] \
# https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# rm -f packages.microsoft.gpg
#
# sudo apt install -y apt-transport-https
# sudo apt install -y code # or code-insiders

# VSCodium
# Open-source vscode - Install this instead - https://github.com/vscodium/vscodium/
flatpak install flathub com.vscodium.codium
flatpak run com.vscodium.codium

###########################################
###########################################

# Install jetbrains toolbox

# Follow instructions here: https://www.jetbrains.com/help/pycharm/installation-guide.html
# May need to run the following if opening toolbox app gives error:
# sudo apt install -y libfuse2
# TLDR:
sudo apt install libfuse2
cd /opt/
sudo tar -xvzf ~/Downloads/jetbrains-toolbox-1.xx.xxxx.tar.gz
sudo mv jetbrains-toolbox-1.xx.xxxx jetbrains
jetbrains/jetbrains-toolbox # Open JetBrains Toolbox (and installs?)

# # Install Pycharm (Avoid on old/slow machines, and use VSCodium there instead): 
# # If toolbox not needed, go for "Standalone installation" of pycharm. Remember to download Pycharm community edition
# sudo tar xzf pycharm-*.tar.gz -C /opt/
# cd /opt/pycharm-professional-2024.1/bin
# sh pycharm.sh

# If the above standalone installation doesn't seem to work, install pycharm flatpak (try to avoid snap Pycharm, it's slower)
# flatpak install -y flathub com.jetbrains.PyCharm-Community
# flatpak run com.jetbrains.PyCharm-Community

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

# Github
sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable \
main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

sudo apt install -y htop plocate

# Useful to check system info in cool way
sudo apt install -y neofetch

# Install tor browser
sudo apt install tor
sudo flatpak install tor-browser

# Only for laptop - Improve Laptop Battery:
# sudo apt install -y tlp tlp-rdw
# sudo tlp start
# Also check TLP-UI and TLP-RDW

# Install VLC 
sudo apt install -y vlc
# Can also install VLC from "Apps Center"
# Remove the gnome video player to remove redundancy
sudo apt remove -y totem

# Download and install google chrome from their website
# For better privacy, install chromium instead
# Select "64 bit .deb" and click "accept and install"
# Once downloaded, open terminal in the download folder and run the following (replace filename if different):
# sudo dpkg -i google_chrome_stable_current_amd64.deb
sudo apt install -y chromium-browser

# Preloads most used apps in RAM for quick reaction times
# sudo apt install -y preload # Skip this on low memory systems
#sudo nano /etc/preload.conf

# Configurations in last section
sudo apt install -y timeshift

# Synaptic Package Manager - apt based package manager
sudo apt install -y synaptic

# Bleachbit -> System cleaner
# Open as root
# Run if PC feels slow
sudo apt install -y bleachbit
# https://docs.bleachbit.org/doc/command-line-interface.html
# sudo apt install -y stacer # Another system cleaner

# Can install Spotify using apt or flatpak. Flatpak example below
flatpak install -y flathub com.spotify.Client

# Firewall
sudo apt install -y ufw

# Run Windows applications on ubuntu - can use actual *.exe files
# flatpak install -y flathub com.usebottles.bottles
# flatpak run com.usebottles.bottles

# KDE Connect
# find out

# Some network stuff
# sudo apt install -y net-tools
# sudo apt install -y nmap # https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
# sudo snap install nutty # Does not seem to open when clicked

# Install any of the following as needed
# sudo apt install -y gimp gparted cargo curl wget unrar unzip 

# sudo apt install -y libreoffice
# libreoffice --writer # To open ms office equivalent app

# sudo apt install -y simplescreenrecorder
# sudo apt install -y kdenlive # Video editor
# sudo apt install -y playonlinux winbind # For installing windows apps on linux # This kept giving me python errors, but flatpak worked
# winapps / wine / lutris / proton are alternatives to playonlinux. Use whatever is best use case per
flatpak install -y flathub com.playonlinux.PlayOnLinux4

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

# Make Dock/Dash always visible (Might be already installed)
# sudo apt install gnome-shell-extension-dashtodock -y # configure from gnome extensions manager

###########################################
###########################################




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
# sudo ufw status numbered
# sudo ufw delete 7 # Use numbers from above numbered command

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
# https://www.wikihow.com/Set-a-Specific-Country-in-a-Tor-Browser


# For changing tor config:
sudo nano /etc/tor/torrc
sudo systemctl reload tor

##########################################

### Users
# Reference: https://learnubuntu.com/list-users/

# to see all users
cat /etc/passwd
getent passwd

getent passwd | wc -l # count of users
getent passwd > user_list.txt # create a copy/file of list of users




# only usernames (first col)
cat /etc/passwd | cut -d: -f1
cat /etc/passwd | awk -F: '{print $1}'
getent passwd | cut -d: -f1
compgen -u

# Check if a username exists on the system:
getent passwd : grep user_name

# List normal users only (for scripting)
eval getent passwd {$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)} | cut -d: -f1

# List currently logged in users
who
users

# Currently login session user
whoami

# Not recommended: To open shell as root, type (Will ask for password, which is by default un-set):
su -

# Instead access root as:
sudo -i # for commands
gksu nautilus # for gui apps
sudo su # opens shell as root

## Log file of linux authentication activity
sudo cat /var/log/auth.log

## Remove ssh access for root user
# Caution: Ensure that there exists another user that can ssh login
# SSH config
sudo nano /etc/ssh/ssh_config
# AllowUsers # remove root from here
# PermitRootLogin # set to no
service ssh restart




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

# Privacy - 
    # Enhanced Tracking Protection = Strict
    # Websitr Privacy Preferences - enable both options (sell/share data and do not track)

# Ublock Origin - Enable relevant filters
# https://github.com/mchangrh/yt-neuter - Add this filter to ublock origin

##### Tor Browser
# Open "Tor Browser Launcher Settings" app -> enable "Download over System Tor"
# Open "Tor Browser" app -> It will download and install

##### Jetbrains Toolbox
# login to the toolbox app
# Toolbox -> Settings -> Enable auto update
# Toolbox -> Install Pycharm Community
# Toolbox -> Pycharm Community Settings -> Auto update, larger memory 

##### alacritty
# ~/config/alacritty/alacritty.yml
# Set a nerd font as default - not needed after setting at system level

#locate alacritty.yml
#mkdir ~/.config/alacritty
#cp /usr/share/doc/alacritty/examples/alacritty.yml ~/.config/alacritty/
# Make changes to ~/.config/alacritty/alacritty.yml for configuring

##### pycharm
# Set "JetbrainsMono Nerd Font" as default editor font
# set latest python as interpreter

##### vscode
# Set "JetbrainsMono Nerd Font" as default editor font
# set latest python as interpreter

##### Firefox:
# Login

# Privacy

# General -> Language and appearance -> Choose dark/light to Automatic 

##### Terminal
# Terminal -> Preferences -> Profiles (unnamed) -> Colors -> disable "Use Transparency from System Theme" -> Enable "Use Transparent Background" and set it to around 5%
# # Set "JetbrainsMono Nerd Font" as default font

##### Calendar
# Open it and let it sync for a while

##### Files
# Preferences -> General -> Enable "Expandable Folders in List view"

##### Chrome or Chromium
# Open Chrome and disable diagnostics

##### Privacy/youtube estensions - reference: https://www.youtube.com/watch?v=rteYHxcLCZk
# https://github.com/mchangrh/yt-neuter
#Return YouTube Dislike: https://returnyoutubedislike.com/
#SponsorBlock: https://sponsor.ajay.app/
#Dearrow (clickbait remover): https://dearrow.ajay.app/
#Unhook: https://unhook.app/
#uBlock Origin: https://ublockorigin.com/
#uBO troubleshooting:   / megathread
#uBO status: https://drhyperion451.github.io/does-...
#Hide YouTube Shorts: https://github.com/gijsdev/ublock-hid...
#NewPipe: https://newpipe.net/

###########################################
###########################################

# Open app "Startup Applications" -> Check if alright

# To delay opening of start-up applicarions,

# Find the .desktop file that corresponds with your application
# in /home/nbhirud/.config/autostart/ directoryand open it in a text editor:

# For example, for jetbrains toolbox:
# /home/nbhirud/.config/autostart/jetbrains-toolbox.desktop
# gedit ~/.config/autostart/jetbrains-toolbox.desktop
# Append/Edit the following line to the file:
#X-GNOME-Autostart-Delay=90
#where 90 is the time in seconds you want to delay the application launch by

#### Another method that doesn't seem to work:
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
# https://github.com/maxwelleite/ubuntu-post-install
# https://github.com/snwh/ubuntu-post-install
# Ubuntu built-in auto-install yaml 

# https://github.com/maxwelleite/floccus
# https://github.com/maxwelleite/ttf-wps-fonts

# Safing Portmaster
# Obfuscate for quickly hiding parts or writing on images
# Nitroshare for file sharing over ethernet, etc


###########################################
###########################################

# clamav and clamtk
sudo apt install -y clamav clamav-daemon clamtk # Found clamtk to be very un-intuitive, but still install
# Configure using - https://docs.clamav.net/manual/Usage/Configuration.html
# TLDR:

# Generate config files:
clamconf -g freshclam.conf > freshclam.conf
clamconf -g clamd.conf > clamd.conf
clamconf -g clamav-milter.conf > clamav-milter.conf

# Create log files:
sudo touch /var/log/freshclam.log
sudo chmod 600 /var/log/freshclam.log
sudo chown clamav /var/log/freshclam.log

sudo touch /var/log/clamav.log
sudo chmod 600 /var/log/clamav.log
sudo chown clamav /var/log/clamav.log

# Configurations:

## freshclam
# Do these configs in ~/freshclam.conf
# LogFileMaxSize 20M
# LogTime yes
# LogRotate yes
# UpdateLogFile /var/log/freshclam.log
# DatabaseOwner clamav
# NotifyClamd yes

## clamd
# Do these configs in ~/clamd.conf
# Comment the "Example"
# LogFile /var/log/clamav.log
# LogFileMaxSize 20M
# LogTime yes
# LogRotate yes
# ExitOnOOM yes # Not sure if this is a good thing to do
# User clamav
# DetectPUA yes
# TLDR of - https://docs.clamav.net/manual/OnAccess.html
# OnAccessIncludePath /home # Figure out if this is the best option
# OnAccessExcludeUname clamav
# OnAccessPrevention yes
# OnAccessDisableDDD yes


###############################################3

# Programming env:

# https://pipx.pypa.io/stable/installation/
sudo apt update
sudo apt install pipx
pipx ensurepath

# https://python-poetry.org/docs/#installing-with-pipx
pipx install poetry
# pipx upgrade poetry
# pipx uninstall poetry

# Poetry completion:
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
# Add to plugins omz array:
         # plugins(
         #  ...
         #	poetry
         #	...
         #	)


##########################################################

# Reference :https://itsfoss.com/speed-up-ubuntu-1310/

# Enable options at login time like recovery by making GRUB load time non zero
sudo gedit /etc/default/grub
# GRUB_TIMEOUT=2
sudo update-grub # kind of reload

# Delay startup apps by appending at the beginning sleep 20; like "flameshot" changes to "sleep 20;flameshot"

# Install preload to speed up app load time
sudo apt install preload

# Choose the best mirror for software updates: 
# This was the first step here where we chose best server. 
sudo apt update

# Use apt-fast instead of apt-get for a speedy update:
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get install apt-fast

# Remove language-related sources from apt update:
sudo gedit /etc/apt/apt.conf.d/00aptitude # Did not find this on my ubuntu
# Acquire::Languages "none";

# Reduce overheating (Laptop)
sudo apt install indicator-cpufreq # For newer systems
# For older systems:
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start

# Use a lightweight desktop environment
# Instead of GNOME, you may opt for a lightweight desktop environment like Xfce or LXDE, or even KDE

# Use lighter alternatives for different applications
# For example, use Gdebi to install packages. Use AbiWord instead of LibreOffice Writer etc.
# VSCodium instead of Pycharm

# Remove Unnecessary software
sudo apt autoremove
flatpak uninstall --unused

# Remove Unnecessary GNOME Extensions

# Use a system cleaner app like bleachbit or Stacer.

# Free up space in /boot partition

# Optimizing SSD Drive
# sudo systemctl status fstrim.timer
# sudo systemctl enable fstrim.timer

# Remove Trash Periodically
# Settings ⇾ Privacy ⇾ File History and Trash -> set Automatically Delete Trash Content

# Use the Memory Saver Feature of Browsers
# Chromium bassed - Tab Sleep/Memory Saver

# Change Swappiness (Advanced)

# Try out differnt values (Temporary)
# cat /proc/sys/vm/swappiness 
# Setting a low swappiness value like 10, 35 or 45, will reduce the chances of the system using swap, resulting in a faster performance.
# sudo sysctl vm.swappiness=45 # 

# To make this change permanent:
# sudo nano /etc/sysctl.conf
# vm.swappiness=45 



