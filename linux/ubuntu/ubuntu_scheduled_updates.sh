


. torsocks off

sudo apt update -y && sudo apt upgrade -y && flatpak update -y && sudo snap refresh && omz update -y && sudo freshclam

sudo apt dist-upgrade -y && sudo do-release-upgrade

# These don't seem to like UEFI
# sudo service fwupd start -y && sudo fwupdmgr refresh -y && sudo fwupdmgr update -y

systemctl daemon-reload && source .zshrc

sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y clean

. torsocks on
