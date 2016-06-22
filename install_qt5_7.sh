#!/bin/bash
mkdir ~/dev;
mkdir ~/dev/qt5_7;
cd ~/dev/qt5_7;
#wget http://download.qt.io/official_releases/qt/5.4/5.4.2/single/qt-everywhere-opensource-src-5.4.2.tar.gz
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/single/qt-everywhere-opensource-src-5.7.0.tar.gz
sudo apt-get install make
tar xvf qt-everywhere-opensource-src-5.7.0.tar.gz
cd qt-everywhere-opensource-src-5.7.0/
./configure -qt-xcb
make
sudo make install
