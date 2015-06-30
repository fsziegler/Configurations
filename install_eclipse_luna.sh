#!/bin/bash
# Script: install_eclipse_luna.sh
echo === Install & remove Eclipse CDT - this leaves the .desktop file
sudo apt-get update
sudo apt-get install -y eclipse-cdt
sudo cp /usr/share/applications/eclipse.desktop /usr/share/applications/eclipse.desktop.bak
sudo apt-get remove -y eclipse-cdt
echo
echo === Download Eclipse CDT Luna
wget http://www.gtlib.gatech.edu/pub/eclipse/technology/epp/downloads/release/luna/R/eclipse-cpp-luna-R-linux-gtk.tar.gz
tar -vxzf eclipse-cpp-luna-R-linux-gtk.tar.gz
rm -f eclipse-cpp-luna-R-linux-gtk.tar.gz
echo
echo === Move eclipse-cdt to /usr/share/eclipse/
sudo mkdir /usr/share/eclipse
sudo cp -vr ./eclipse/* /usr/share/eclipse/
sudo rm -rf ./eclipse
echo
echo === Create link to /usr/share/freemind/ in /usr/bin
pushd .
sudo rm /usr/bin/eclipse
cd /usr/bin && sudo ln -s /usr/share/eclipse/eclipse /usr/bin/eclipse
sudo apt-get install -y desktop-file-utils
cd /usr/share/applications && sudo mv eclipse.desktop.bak eclipse.desktop && sudo desktop-file-install eclipse.desktop
popd

