
# List of packages/apps installed
# maybe make a cron job which does the following


DATE_VAR = $(date +%Y-%m-%d)
mkdir nbUbuntu_DellOptiplex790_$DATE_VAR
cd nbUbuntu_DellOptiplex790_$DATE_VAR

# https://stackoverflow.com/questions/17066250/create-timestamp-variable-in-bash-script
apt list > apt_list_$(date +%Y-%m-%d_%H-%M-%S).txt # I think this shous all apps inclusing not installed ones
apt list --installed > apt_list_installed_$(date +%Y-%m-%d_%H-%M-%S).txt
flatpak list > flatpak_list_$(date +%Y-%m-%d_%H-%M-%S).txt
snap list > snap_list_$(date +%Y-%m-%d_%H-%M-%S).txt

