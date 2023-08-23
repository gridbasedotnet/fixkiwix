#!/bin/bash
# This script is intended to fix any error that may have arisen with the kiwix library on the base station.
# Please see the readme on the GitHub page regarding this error for more details.

echo "Whoops! Looks like your internet went dark. That wasn't supposed to happen!"
sleep 1
echo "Let's get started."
echo "During this process, please be patient."
sleep 2

# Check if the user has downloaded the file
if [[ ! -f ~/library_zim.xml ]]; then
    echo "Downloading the file..."
    wget https://github.com/gridbasedotnet/fixkiwix/raw/main/library_zim.xml -O ~/library_zim.xml
fi

# Remove the old library
echo "Removing the old library..."
sudo rm -f /home/gridbase/kiwixrepo/library_zim.xml
sleep 1

# Move the new library into its place
echo "Copying the new library..."
sudo cp ~/library_zim.xml /home/gridbase/kiwixrepo/
sleep 3

# Ask if the user wants to reboot
echo "The system needs a reboot for changes to take effect."
read -p "Would you like to reboot now? (y/n) " yn
case $yn in
    [yY] ) echo "Rebooting..."
        sudo reboot ;;
    [nN] ) echo "See ya!"
        exit ;;
    * ) echo "Invalid response." ;;
esac
