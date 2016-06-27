#!/bin/sh
# Copyright (c) 2016 Frederick S. Ziegler
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
# Written 2016-06-16 by Fred Ziegler
# Adapted from https://help.ubuntu.com/community/ApacheMySQLPHP
# Designed for Ubuntu Linux systems - should work on any Debian system.
#

chmod +x *.sh
export PROMPT_COMMAND='history -a'
mv ~/.bashrc ~/.bashrc.orig
cp .bashrc ~/.bashrc
sudo apt-get update
sudo apt-get -y install gitg aptitude xclip vim uuid 
sudo apt-get -y install lamp-server^ mysql-workbench
sudo apt-get -y install ec2-api-tools
sudo apt-get -y install curl
sudo apt-get -y install php libapache2-mod-php php-mcrypt php-mysql
sudo apt-get -y install phpmyadmin
sudo apt-get -y install php-mbstring
sudo apt-get -y install php-gettext
sudo apt-get -y install mcrypt
sudo php5enmod mcrypt
sudo /usr/sbin/apache2ctl restart
# The following line enables apache to run scripts and programs in the sub/directories it is run in:
# sudo chown www-data:www-data -R .
