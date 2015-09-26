#!/bin/bash
# Script: install_freemind_1.0.1.sh
echo === Install & remove freemind 0.9.0 - this leaves the .desktop file
sudo apt-get update
sudo apt-get install -y openjdk-7-jre
sudo apt-get install -y freemind
sudo cp /usr/share/applications/freemind.desktop /usr/share/applications/freemind.desktop.bak
sudo apt-get remove -y freemind
# Command to remove all freemdind.desktop: `locate freemind.desktop | xargs sudo rm`
echo
echo === Download freemind
wget http://sourceforge.net/projects/freemind/files/freemind/1.0.1/freemind-bin-max-1.0.1.zip
unzip freemind-bin-max-1.0.1.zip -d freemind
rm -f freemind-bin-max-1.0.1.zip
chmod +x freemind/freemind.sh
sudo mkdir /usr/share/freemind
echo
echo === Copy freemind to /usr/share/freemind/
sudo cp -r ./freemind/* /usr/share/freemind/
sudo rm -rf ./freemind
echo
echo === Create link to /usr/share/freemind/ in /usr/bin
pushd .
cd /usr/bin && sudo ln -s /usr/share/freemind/freemind.sh /usr/bin/freemind
sudo apt-get install -y desktop-file-utils
cd /usr/share/applications && sudo mv freemind.desktop.bak freemind.desktop && sudo desktop-file-install freemind.desktop
sudo jar xf /usr/share/freemind/lib/freemind.jar images/FreeMindWindowIcon.png
sudo mv ./images/FreeMindWindowIcon.png /usr/share/pixmaps
sudo rm -rf ./images
popd
echo "=== Please note that it often takes a few seconds before FreeMind shows up under Applications->Office"
