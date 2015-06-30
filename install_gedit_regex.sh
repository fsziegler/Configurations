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
# Written 2015-01-20 by Fred Ziegler
# Designed for Ubuntu Linux systems - should work on any Debian system.
#
# This script installs advanced-find, the best regex plugin for gedit I have 
# found to date.

wget https://advanced-find.googlecode.com/files/advanced_find-3.6.0.tar.gz
tar -xvzf advanced_find-3.6.0.tar.gz
rm -f advanced_find-3.6.0.tar.gz
cd advanced_find-3.6.0/
mkdir ~/.local/share/gedit
mkdir ~/.local/share/gedit/plugins
cp -R ./advancedfind* ~/.local/share/gedit/plugins
cd ..
sudo rm -rf advanced_find-3.6.0
sudo killall gedit
gedit &
echo ========================= USER ACTION REQUIRED =========================
echo Switch to gedit
echo Open Edit:Preferences:Plugins
echo Check Advanced Find/Replace

