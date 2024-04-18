
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

