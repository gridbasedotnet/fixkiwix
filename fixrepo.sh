#!/bin/bash
# This script is intended to fix any error that may have arisen with the kiwix library.
# Please see the readme on the GitHub page regarding this error for more details.

echo "Whoops! Looks like your internet went dark. That wasn't supposed to happen!"
sleep 1
echo "Let's get started."
echo "During this process, please be patient."
sleep 2

while true; do
    read -p "Have you downloaded the file from https://tinyurl.com/bdhf6jd5 (y/n) " yn
    case $yn in
        [yY]  ) echo "OK, we will proceed with the fix."
            break ;;
        [nN] ) echo "Please download the file into your downloads folder on your base station and run the script again after it is downloaded..."
            exit 1 ;;
        * ) echo "Invalid response." ;;
    esac
done

# Script begins clearing out the old library
sudo rm -f /home/gridbase/kiwixrepo/library_zim.xml
sleep 1

# Script begins moving the new library into its place
sudo cp /home/gridbase/Downloads/library_zim.xml /home/gridbase/kiwixrepo/
sleep 3

# Move is finalized. Proceed with reboot
echo "Your library is fixed!"
sleep 1

echo "The system needs a reboot for changes to take effect."
read -p "Would you like to reboot now? (y/n) " yn
case $yn in
    [yY] ) echo "Rebooting..."
        sudo reboot ;;
    [nN] ) echo "See ya!"
        exit ;;
    * ) echo "Invalid response." ;;
esac
