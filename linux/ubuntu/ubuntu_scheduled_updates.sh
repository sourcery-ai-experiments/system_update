


. torsocks off

sudo apt update -y && sudo apt upgrade -y && flatpak update -y && sudo snap refresh && omz update -y && sudo freshclam

sudo apt dist-upgrade -y && sudo do-release-upgrade

# These don't seem to like UEFI
# sudo service fwupd start -y && sudo fwupdmgr refresh -y && sudo fwupdmgr update -y

systemctl daemon-reload && source .zshrc

sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y clean

. torsocks on

########################################3

systemctl list-unit-files # Check status of systemctl services
systemctl list-unit-files --state=running # running, enabled, disabled, masked, static, active
systemctl list-unit-files --state-running --type=service # lists all systemd services that are running
# Can use Stacer GUI app for checking if you prefer so
