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

mkdir ~/apps
cd ~/apps
# Install Qt Creator 5.4.2
mkdir qt-5.4.2
cd qt-5.4.2/
wget http://download.qt.io/official_releases/qt/5.4/5.4.2/qt-opensource-linux-x86-5.4.2.run
chmod +x qt-opensource-linux-x86-5.4.2.run 
./qt-opensource-linux-x86-5.4.2.run 

# Install GDB 7.10 with Python support
mkdir ../gdb7.10
cd ../gdb7.10
wget http://ftp.gnu.org/gnu/gdb/gdb-7.10.tar.gz
tar -xvzf gdb-7.10.tar.gz
cd gdb-7.10/
cd gdb
./configure --prefix /usr/local/gdb-python2 --with-python
make
sudo apt-get install texinfo
sudo make install
gdb --version
sed -i -r 's/>\/usr\/bin\/gdb/>\/home\/fred\/apps\/gdb\/gdb-7.10\/gdb/' ~/dev/qt-creator/tests/system/settings/unix/QtProject/qtcreator/debuggers.xml
sed -i -r 's/System GDB at \/usr\/bin\/gdb/System GDB 7.10 with Python support/' ~/dev/qt-creator/tests/system/settings/unix/QtProject/qtcreator/debuggers.xml
