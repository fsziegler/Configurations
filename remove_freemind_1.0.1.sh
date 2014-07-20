#!/bin/bash
# Script: remove_freemind_1.0.1.sh
# Remove freemind installation
sudo rm /usr/share/applications/freemind.desktop /usr/share/applications/freemind.desktop.bak
sudo apt-get remove -y freemind
# Command to remove all freemdind.desktop: `locate freemind.desktop | xargs sudo rm`
sudo rm freemind-bin-max-1.0.1.zip
sudo rm -rf freemind
sudo rm -rf /usr/share/freemind
sudo rm /usr/bin/freemind
sudo apt-get remove -y desktop-file-utils
locate freemind.desktop | xargs sudo rm 
