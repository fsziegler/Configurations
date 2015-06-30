#!/bin/bash
# Script: install_eclipse_mars.sh
echo === Install & remove eclipse-cdt - this leaves the .desktop file
sudo apt-get update
#sudo apt-get install -y openjdk-7-jre
sudo apt-get install -y eclipse-cdt
sudo cp /usr/share/applications/eclipse.desktop /usr/share/applications/eclipse.desktop.bak
sudo apt-get remove -y eclipse-cdt
# Command to remove all eclipse.desktop: `locate freemind.desktop | xargs sudo rm`
echo
echo === Download eclipse-cdt Mars
wget http://www.gtlib.gatech.edu/pub/eclipse/technology/epp/downloads/release/mars/R/eclipse-cpp-mars-R-linux-gtk.tar.gz
tar -vxzf eclipse-cpp-mars-R-linux-gtk.tar.gz
rm -f eclipse-cpp-mars-R-linux-gtk.tar.gz
sudo mkdir /usr/share/eclipse
echo
echo === Copy eclipse-cdt to /usr/share/eclipse/
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

