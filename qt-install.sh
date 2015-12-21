#!/bin/bash
# Script: install_qtcreator_1.0.1.sh
echo === Install & remove qtcreator - this leaves the .desktop file
#sudo apt-get update
sudo apt-get install -y qtcreator
sudo cp /usr/share/applications/qtcreator.desktop /usr/share/applications/qtcreator.desktop.bak
sudo apt-get remove -y qtcreator

echo === Create link to /usr/share/qtcreator/ in /usr/bin
cd /usr/bin && sudo ln -s /opt/Qt5.4.2/Tools/QtCreator/bin/qtcreator /usr/bin/qtcreator
sudo apt-get install -y desktop-file-utils
sudo sed -i 's/QtProject-qtcreator/qtcreator_logo_24/g' /usr/share/applications/qtcreator.desktop.bak
sudo cp /opt/Qt5.4.2/Tools/QtCreator/share/qtcreator/templates/wizards/qtcreatorplugin/qtcreator_logo_24.png /usr/share/pixmaps
cd /usr/share/applications && sudo mv qtcreator.desktop.bak qtcreator.desktop && sudo desktop-file-install qtcreator.desktop

