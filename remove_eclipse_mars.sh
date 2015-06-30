#!/bin/bash
# Script: remove_eclipse_mars.sh
# Remove Eclipse installation
sudo rm /usr/share/applications/eclipse.desktop /usr/share/applications/eclipse.desktop.bak
sudo apt-get remove -y eclipse-cdt eclipse-platform
# Command to remove all eclipse.desktop: `locate eclipse.desktop | xargs sudo rm`
sudo rm eclipse-cpp-mars-R-linux-gtk.tar.gz
sudo rm -rf eclipse
sudo rm -rf /usr/share/eclipse
sudo rm /usr/bin/eclipse
locate eclipse.desktop | xargs sudo rm

