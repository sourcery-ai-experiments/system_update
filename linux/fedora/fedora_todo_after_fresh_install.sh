
# The following has been tested on:
# Fedora Linux 40 (Workstation Edition) x86_64

#######################################################

# Configurations to dnf
# https://dnf.readthedocs.io/en/latest/conf_ref.html
# sudo nano /etc/dnf/dnf.conf
# fastestmirror=True
# max_parallel_downloads=5
# defaultyes=True

# Another way
# echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
# echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf

# Enable RPM Fusion
# https://rpmfusion.org/Configuration

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# If the above doesn't work, there is another GUI method in the link
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf update -y && sudo dnf upgrade --refresh -y
sudo dnf groupupdate core

# Install Media Codecs
# https://rpmfusion.org/Howto/Multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
sudo dnf install libva-intel-driver # This is for old intel chips, for others check the link

# More codecs
# https://docs.fedoraproject.org/en-US/quick-docs/installing-plugins-for-playing-movies-and-music/
sudo dnf group install Multimedia
# sudo dnf install gstreamer1-plugins-{base,good,bad,ugly,libav} gstreamer1-plugin-openh264 libdvdcss libdvdread # above contains this?


# Enable fathub repo in flatpak (Not enabled by default in fedora)
# https://flatpak.org/setup/Fedora
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# flatpak remote-modify --enable flathub # A different way of doing the above?

# Install snap
# sudo dnf install snapd # skip this

# Set host-name (name the computer)
sudo hostnamectl set-hostname "nbFedora"


# Firmware updates:
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update


# Install relavent Nvidia/AMD GPU drivers 
# Search and install based on system


sudo dnf update -y && sudo dnf upgrade --refresh -y
# reboot

#######################################################

### Shell

# bash
sudo dnf install bash-completion

# zsh
sudo dnf install -y zsh autojump
chsh -s $(which zsh) # set zsh as default


# Rest of the OMZ setup is same as on Ubuntu
omz update
source .zshrc 


#######################################################

### Install software

# Install GNOME Tweaks
sudo dnf install -y gnome-tweaks

# Install Extensions Manager
flatpak install flathub com.mattjakeman.ExtensionManager # Or install the GNOME Extensions app
sudo dnf install -y gnome-browser-connector
# Go to extensions.gnome.org and install the browser extension

# Install useful things:
sudo dnf install -y vlc htop neofetch gimp gparted bleachbit kdenlive transmission 

sudo dnf install -y chromium

# LibreWolf
# https://librewolf.net/installation/
# add the repo
curl -fsSL https://rpm.librewolf.net/librewolf-repo.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
# install the package
sudo dnf install -y librewolf

# auto-cpufreq # Install for better battery management on laptops

# Pachage manager (for fedora like what synaptic is for ubuntu)
sudo dnf isntall -y dnfdragora

# Speeds up opening of most used apps (avoid on low end or low RAM PCs)
sudo dnf install -y preload 
# sudo dnf copr enable elxreno/preload -y && sudo dnf install preload -y

# To connect phone and PC
sudo dnf install -y kdeconnectd 
# Also check GSConnect GNOME extension
# Install KDE Connect on android phone and connect both

# sudo dnf install -y steam # If you wish to play games

# VLC
# https://www.videolan.org/vlc/download-fedora.html
# su -
# dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# dnf install vlc
# dnf install python-vlc # (optional)

# https://docs.fedoraproject.org/en-US/quick-docs/installing-and-running-vlc/
sudo dnf install -y  vlc
sudo dnf remove -y totem # Remove stock video player



# # Set up automatic updates: (Read more and see if there are any better alternatives before installing this)
# sudo dnf install -y dnf-automatic
# sudo systemctl enable dnf-automatic.timer
# sudo systemctl start dnf-automatic.timer

# Find out more about this (what is this doing exactly?):
# sudo dnf install fedore-workstation-repositories
# sudo dnf config-manager --set-enabled google-chrome
# sudo dnf install google-chrome-stable

######################################################

### Backups


sudo dnf install -y timeshift # For backups

######################################################

# Web UI for system monitoring
# sudo dnf install cockpit
# sudo systemctl start cockpit
# sudo systemctl enable cockpit
# https://localhost:9090

######################################################

# Good software for running virtual machines:
# KVM is a powerful tool
# sudo dnf install -y qemu @Virtualization # Another tool

######################################################

# Remove unused software
# Thunderbird
# Boxes



######################################################

### VSCodium
# Flatpak is easier to install, but I could not get zsh working with it. So install using external repo

# flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo # Add flathub repo
# flatpak install -y flathub com.vscodium.codium # Install it
# flatpak run com.vscodium.codium # Run it
# sudo flatpak uninstall com.vscodium.codium # uninstall it

# https://vscodium.com/#install
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

# codium # to run it

# Uninstall
# sudo dnf remove codium
# sudo rm /etc/yum.repos.d/vscodium.repo

#######################################################

# https://support.torproject.org/rpm/


nano /etc/yum.repos.d/tor.repo

## Paste the following:
# [tor]
# name=Tor for Fedora $releasever - $basearch
# baseurl=https://rpm.torproject.org/fedora/$releasever/$basearch
# enabled=1
# gpgcheck=1
# gpgkey=https://rpm.torproject.org/fedora/public_gpg.key
# cost=100

dnf install tor -y

sudo nano /etc/tor/torrc
## Paste the following, and modify as necessary:
# EntryNodes {ca}{us}{uk} StrictNodes 1
# ExitNodes {ca}{us}{uk} StrictNodes 1
sudo systemctl reload tor

source torsocks on
echo ". torsocks on" >> ~/.bashrc
echo ". torsocks on" >> ~/.zshrc


## DNS over Tor

# Step 1
# Download cloudflared from here: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/
# TLDR: download this for Fedora: https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm

# Step 2:
# https://developers.cloudflare.com/1.1.1.1/encryption/dns-over-https/dns-over-https-client/
# TLDR: 
cloudflared --version  # verify if its installed

###
sudo tee /etc/systemd/system/cloudflared-proxy-dns.service >/dev/null <<EOF
[Unit]
Description=DNS over HTTPS (DoH) proxy client
Wants=network-online.target nss-lookup.target
Before=nss-lookup.target

[Service]
AmbientCapabilities=CAP_NET_BIND_SERVICE
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
DynamicUser=yes
ExecStart=/usr/local/bin/cloudflared proxy-dns

[Install]
WantedBy=multi-user.target
EOF
###

sudo systemctl enable --now cloudflared-proxy-dns
sudo rm -f /etc/resolv.conf
echo nameserver 127.0.0.1 | sudo tee /etc/resolv.conf >/dev/null
dig +short @127.0.0.1 cloudflare.com AAAA # verify if it works

# Step 3"
# https://blog.cloudflare.com/welcome-hidden-resolver/
# https://developers.cloudflare.com/1.1.1.1/other-ways-to-use-1.1.1.1/dns-over-tor/
dnf install -y socat
sudo socat TCP4-LISTEN:443,reuseaddr,fork SOCKS4A:127.0.0.1:dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion:443,socksport=9150

###
cat << EOF >> /etc/hosts
127.0.0.1 dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion
EOF

###

cloudflared proxy-dns --upstream "https://dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion/dns-query"

#######################################################

# ufw

# https://linuxconfig.org/how-to-install-and-use-ufw-firewall-on-linux
# https://www.baeldung.com/linux/uncomplicated-firewall


# Fedora comes with firewalld
# Figure out which is better and learn an configure

#######################################################

sudo dnf update -y
sudo dnf upgrade -y

# sudo dnf upgrade --refresh -y
# sudo dnf install dnf-plugin-system-upgrade -y
# sudo dnf system-upgrade download --releasever=40 -y

# sudo dnf system-upgrade reboot -y

# reboot
######################################################

flatpak install -y flathub com.jetbrains.PyCharm-Community
# flatpak run com.jetbrains.PyCharm-Community

# dnf install
# dnf remove

# dnf check
# dnf check-update
# sudo dnf distro-sync
# dnf info
# dnf list
# dnf list installed # displays list of all installed packages
# dnf search
# dnf updateinfo
# dnf upgrade
# dnf upgrade-minimal
# dnf system-upgrade
# sudo dnf --refresh upgrade

# dnf clean all

######################################################

# Make Dock/Dash always visible
# sudo dnf install -y gnome-shell-extension-dash-to-dock # configure from gnome extensions manager

########################################################

# Wine for installing Windows apps
# sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/40/winehq.repo
# sudo dnf install winehq-stable
# wine --version
# download Windows exe installer, and right click and open with wine to install them.

######################################################

# rEFERENCE: https://www.linuxcapable.com/install-clamav-on-fedora-linux/
sudo dnf upgrade --refresh # Refresh Fedora System Packages
# sudo dnf install -y clamav clamav-daemon clamtk 
sudo dnf install clamav clamd clamav-update clamtk #  Install ClamAV  and ClamTK GUI

# Update the ClamAV Virus Database
sudo systemctl stop clamav-freshclam 
sudo freshclam
sudo systemctl enable clamav-freshclam --now
ls -l /var/lib/clamav/ # Check ClamAV directory and the dates of the files

# Scanning:
# sudo clamscan [options] [file/directory/-]
sudo clamscan -h # Help
sudo clamscan /home/script.sh # Scan a file
sudo clamscan /home/ # Scan a dir
sudo clamscan -i /home/ # Print only infected files
sudo clamscan -o /home/ # Exclude printing OK files
sudo clamscan --bell -i /home # bell notification upon virus detection
sudo clamscan --bell -i -r /home # Scan directories recursively 
sudo clamscan --bell -i -r /home -l output.txt # Save the scan report to file 
sudo clamscan -i -f /tmp/scan # Scan files listed line-by-line in a specified file 
sudo clamscan -r --remove /home/USER # automatically remove infected files detected during the scan
sudo clamscan -r -i --move=/home/USER/infected /home/ # Move all files requiring quarantine into the specified location
sudo nice -n 15 clamscan && sudo clamscan --bell -i -r /home # To limit CPU usage during the scan, use the nice command

# Scheduled ClamAV Scans
crontab -e
# sudo dnf install cronie # IF ABOVE DOESN'T WORK
# add following line to add daily scan
# 0 1 * * * /usr/bin/clamscan -r --quiet --move=/home/USER/infected /home/

# ClamAV configuration file located at /etc/clamav/clamd.conf

    MaxFileSize: Adjust the maximum file size that ClamAV will scan.
    MaxScanSize: Change the maximum data size that ClamAV will scan within an archive or a file.
    HeuristicScanPrecedence: Enable or disable heuristic scanning, which uses techniques to detect unknown malware.




######################################################

# Scheduled update, etc:






#################################################################
# Custom linux aliases - add to ~/.zshrc
#################################################################

# Application shortcuts:
alias codium="flatpak run com.vscodium.codium "

# Update/Upgrade related:
alias nbupdate="sudo dnf update -y && sudo dnf upgrade -y && flatpak update -y && sudo freshclam && omz update -y"
# alias nbdistu="sudo apt dist-upgrade -y && sudo do-release-upgrade"
alias nbreload="systemctl daemon-reload && source ~/.zshrc"
alias nbclean="dnf clean -y all && flatpak uninstall --unused"
# alias nbtoron=". torsocks on"
# alias nbtoroff=". torsocks off"

#################################################################

### Settings


# DNS:
# Same as ubuntu

# Privacy





### Search in Super menu 
# Same as ubuntu




#################################################################

### App specific Settings


### Firefox Tweaks:
# about:config
# layers.acceleration.force-enabled
# gfx.webrender.all

### 

################################################################

### UI Customization

# Themes
# can find some on dnfdragora too
# apply using GNOME Tweaks app

# Icon Packs

# App specific themes

# Wallpaper


################################################################

# Better Fonts:
sudo dnf copr enable dawid/better_fonts -y
sudo dnf install fontconfig-font-replacements -y
sudo dnf install fontconfig-enhanced-defaults -y

# Change default fonts using GNOME Tweaks
# Change app specific fonts 





