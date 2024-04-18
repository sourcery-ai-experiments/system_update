
# Use Tails on public computers like in library, etc if you need to download or surf the internet. It always
# feels like my pen drive must be carrying a lot of viruses or malware after downloading or even plugging it in
# such public computers. So I feel its best to skip the OS of public computers altogether for the sake of keeping
# your home computer safe (because you will end up plugging the same USB from public PC on home PC and transferring
# some malware)

# To create Tails USB from linux (or any OS USB for that matter):
cd Downloads
ls # Get the img filename, say tails_os.img
lsblk # Get the device name of USB stick - confirm using disk size, say /dev/sde
# The following should create the tails usb:
sudo dd if=tails_os.img of=/dev/sde bs=16M oflag=direct status=progress



