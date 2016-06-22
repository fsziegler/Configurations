#!/bin/bash
mkdir ~/dev;
mkdir ~/dev/qt5_7;
cd ~/dev/qt5_7;
#wget http://download.qt.io/official_releases/qt/5.4/5.4.2/single/qt-everywhere-opensource-src-5.4.2.tar.gz
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/single/qt-everywhere-opensource-src-5.7.0.tar.gz
sudo apt-get install make
sudo apt-get -y install g++
tar xvf qt-everywhere-opensource-src-5.7.0.tar.gz
cd qt-everywhere-opensource-src-5.7.0/
echo "Run ./configure -qt-xcb, then make, then sudo make install"
