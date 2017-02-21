#!/bin/bash
# Script: install_eclipse_luna.sh

# echo === Install & remove Eclipse CDT - this leaves the .desktop file
# sudo apt-get update
# sudo apt-get install -y eclipse-cdt
# sudo cp /usr/share/applications/eclipse.desktop /usr/share/applications/eclipse.desktop.bak
# sudo apt-get remove -y eclipse-cdt
echo
echo === Download GanttProject 2.8.1
wget -O ganttproject_2.8.1-r2024-1_all.deb http://www.ganttproject.biz/dl/2.8.1/lin
sudo dpkg -i ./ganttproject_2.8.1-r2024-1_all.deb
sudo apt-get install -f ganttproject
echo
echo === Create link to /usr/share/ganttproject/ in /usr/bin
pushd .
sudo rm /usr/bin/ganttproject
cd /usr/bin && sudo ln -s /usr/share/ganttproject/ganttproject /usr/bin/ganttproject
sudo apt-get install -y desktop-file-utils
cd /usr/share/applications && sudo desktop-file-install --rebuild-mime-info-cache ganttproject.desktop
popd

