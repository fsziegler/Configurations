MultiSystem (http://liveusb.info/dotclear/) is a program that can be installed onto a USB flash drive, after which you can add any ISO file that you wish to boot from to that drive. Whenever you boot from the flash drive, MultiSystem will present a menu of the ISO files, and you can choose which one to boot from.

To install MultiSystem [adapted from http://ubuntuforums.org/showthread.php?t=2175738 and http://askubuntu.com/questions/380547/simple-cli-to-append-one-file-to-the-end-of-another]
 1. `echo deb http://liveusb.info/multisystem/depot all main | sudo tee -a /etc/apt/sources.list`
 2. `sudo apt-get update`
 3. `sudo apt-get install multisystem`
 4. Run Multisystem, and format a USB flash drive.
 5. Now, add the ISO files you wish to be bootable. Note that the "ISO Select" UI in the current version of Multisystem appears not to work; to add an ISO to the USB drive, use a file manager (e.g., dolphin or nautilus) to find the file, then drag and drop it into the bottom window in Multisystem.
