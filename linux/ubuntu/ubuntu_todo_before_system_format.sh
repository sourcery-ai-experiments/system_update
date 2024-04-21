
# List of packages/apps installed
# maybe make a cron job which does the following

apt list > apt_list.txt
apt list --installed > apt_list_installed.txt
flatpak list > flatpak_list.txt
snap list > snap_list.

