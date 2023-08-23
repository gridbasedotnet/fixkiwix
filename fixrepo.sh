#!/bin/bash/
# this script is intended to fix any error that may have arisen with the kiwix library
# please see the read me on the github page regarding this error for more details. 

sudo su

echo Whoops! looks like your internet went dark. That wasn't supposed to happen!

sleep 1

cho lets get started

echo during this process please be patient. 

sleep 2

while true; do

read -p "have you downloaded the file from https://drive.google.com/file/d/1RDjvd6UIHs4jnUjBjQGEDsFkbdMclNb8/view?usp=drive_link (yes/no) " yn 

case $yn in
		yes ) echo ok, we will proceed with the fix;
				break ;;
		no ) echo please download the file and run the script again after it is downloaded...;
				exit 1;;
		* ) echo invalid response;;
		
esac

done

# script begins clearing out the old library

sudo su

rm -r /home/gridbase/kiwixrepo/library_zim.xml

sleep 1

# script begins moving new library into its place

cp /home/gridbase/Downloads/library_zim.xml /home/gridbase/kiwixrepo

sleep 3

# move is finalized. proceed with reboot

echo your library is fixed!

sleep 1

echo system needs reboot for changes to take effect. 

read -p "would you like to reboot now?" yn
		[yY] ) echo rebooting
				reboot now ;;
		[nN] echo see ya!
				exit;;
		* ) echo invalid response;;
		
exit
