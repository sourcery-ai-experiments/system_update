
# Install/Upgrade Powershell:
#  winget search Microsoft.PowerShell # Shows available options
# winget install --id Microsoft.Powershell --source winget
winget upgrade --id Microsoft.Powershell --source winget  # Installs if not already installed, else upgrades

# Install Tor (not the browser)
# Download the archive from here: https://www.torproject.org/download/tor/



# Install Tor Browser. It has stand-alone tor built in. Skip above step of downloading tor separately.
# Create a tor service by using the the following command as an example:
# sc create tor start=auto binPath="<PATH TO>\Tor\tor.exe -nt-service"
# Example:
# sc create tor start=auto binPath="D:\Tor Browser\Browser\TorBrowser\Tor\tor.exe -nt-service"
# D:\Tor Browser\Browser\TorBrowser\Tor\tor.exe –-service install # Didn't work for me
# You can access the tor on 127.0.0.1:9050

# Config:
# Edit the following file:  D:\Tor Browser\Browser\TorBrowser\Data\Tor\torrc
# Add the following at the bottom:
# EntryNodes {ca}{us}{uk} StrictNodes 1
# ExitNodes {ca}{us}{uk} StrictNodes 1


###########################################################
## TO DO before windows re-installation:
###########################################################

# Powershell: To list all installed apps:
# Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize

# Following creates a file instead:
# Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize > D:\nbhirud\InstalledPrograms.txt

# Powershell - Another alternative to get List of installed software.:
# Get-StartApps

# Export/Backup bookmarks from firefos/chrome/tor/brave/etc. as html as well as json

# CMD - Note down windows product key:
# wmic path softwareLicensingService get OA3xOriginalProductKey

###### Export settings from apps:
# D:\Tor Browser\Browser\TorBrowser\Data\Tor\torrc
# %APPDATA% # The Roaming folder has useful config files of most apps
# %ALLUSERSPROFILE% # Not so imp, but have a look if theres any config
# Registry - Export the whole thing using RegEdit
# C:\Windows\Fonts
# C:\Windows\System32\drivers\etc\hosts
# vscode config
# pycharm config
# Firefox config


# Screenshot of settinf=gd from apps:


# Download latest important drivers (For dell XPS - make sure to get wifi driver)
# Download the latest antivirus installer (ideally offline)


# Create Win10 bootable USB

# Eject all the external drives


# Backup password database if using something like KeyPass

# Backup data - including the following:
# Downloads
# Documents
# Pictures
# PycharmProjects
# VSodeProjects

# Backup any database if running like Postgres


# Backup portable app folders like: adb


