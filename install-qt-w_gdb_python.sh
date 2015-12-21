#!/bin/sh
# Copyright (c) 2014 Frederick S. Ziegler
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Written 2015-12-20 by Fred Ziegler
# This downloads and builds Qt Creator and associated apps such that one can 
# debug with a version of GDB that supports Python.

echo === Remove any previous installations
sudo rm -rf ~/apps/gdb
sudo rm -rf ~/apps/qt*
sudo rm -rf /opt/Qt*
sudo rm /usr/share/applications/qtcreator.desktop*
sudo apt-get remove qtcreator
sudo rm /usr/bin/qtcreator
sudo rm /usr/share/pixmaps/qt*
sudo rm -rf /usr/local/gdb-python2

# Install Qt Creator 5.4.2
echo === Install Qt Creator 5.4.2
mkdir ~/apps ~/apps/qt-5.4.2
cd ~/apps/qt-5.4.2
qt_install=qt-opensource-linux-x86-5.4.2.run
qt_url=http://download.qt.io/official_releases/qt/5.4/5.4.2/
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
   qt_install=qt-opensource-linux-x64-5.4.2.run
   echo $qt_install
else
   echo $qt_install
fi
qt_url=$qt_url$qt_install
echo $qt_url
wget $qt_url
sudo chmod +x $qt_install
sudo ./$qt_install
sudo rm ./$qt_install

# Install GDB 7.10 with Python support
echo === Install GDB 7.10 with Python support
mkdir ~/apps/gdb
cd ~/apps/gdb
sudo wget http://ftp.gnu.org/gnu/gdb/gdb-7.10.tar.gz
sudo tar -xvzf gdb-7.10.tar.gz
sudo rm gdb-7.10.tar.gz
cd gdb-7.10
sudo ./configure --prefix /usr/local/gdb-python2 --with-python
#sudo apt-get -y install libbfd-dev
sudo make
sudo apt-get -y install texinfo
sudo make install
gdb/gdb --version

# Determine the local user name
path=${PWD}
prefix="\/home\/"
suffix="\/apps\/gdb\/gdb-7.10"
user=$(echo $path | sed "s/^$prefix//" | sed "s/$suffix$//")
echo user = $user
sudo chown -R $user ~/apps/gdb

# Start and then kill Qt Creator in order to populate the debuggers.xml file  
# with the wrong version of gdb
echo === Start and then kill Qt Creator in order to populate the debuggers.xml file
/opt/Qt5.4.2/Tools/QtCreator/bin/qtcreator > /dev/null 2>&1 &
sleep 5
killall -9 qtcreator
# Change the Qt Creator config file ownership to the local user
sudo chown -R $user ~/.config/QtProject/qtcreator

# Populate the debuggers.xml file with the right version of gdb, which supports 
# python
echo === Populate the debuggers.xml file with the right version of gdb
cd ~/apps/gdb/gdb-7.10/gdb
gdbPath=${PWD}
gdbPath2=$(echo $gdbPath | sed 's|/|\\/|g')
sed -i "s/>\/usr\/bin\/gdb/>$gdbPath2\/gdb/g" ~/.config/QtProject/qtcreator/debuggers.xml
sed -i "s/>System GDB at \/usr\/bin\/gdb</>GDB 7.10 with Python support</g" ~/.config/QtProject/qtcreator/debuggers.xml

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

