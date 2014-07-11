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
# Written 2011-09-20 by Fred Ziegler
# Designed for Ubuntu Linux systems - should work on any Debian system.
#
# This script collects a list of all the apps installed by "apt-get" on the current system and
# generates the script "install_apps.sh" for installing these apps on any other Ubuntu [Debian] 
# system.

# Dump all installed app names into install_apps.sh
rm -rf ./install_apps.sh
dpkg --get-selections >> ./install_apps.sh

# Remove all "deinstall" lines in script
sed -e "s/.*deinstall//g" ./install_apps.sh > /tmp/tempfile.tmp
mv /tmp/tempfile.tmp ./install_apps.sh
sed "/^$/d" ./install_apps.sh > /tmp/tempfile.tmp
mv /tmp/tempfile.tmp ./install_apps.sh

# Remove "install" text in script
sed -e "s/[\t]*install//ig" ./install_apps.sh > /tmp/tempfile.tmp
mv /tmp/tempfile.tmp ./install_apps.sh

# Prepend "sudo apt-get install -y " for each app to install
sed -e "s/.*/sudo apt-get install -y &/g" ./install_apps.sh > /tmp/tempfile.tmp
mv /tmp/tempfile.tmp ./install_apps.sh

# Preface script with header and comment
echo '#!/bin/sh' > /tmp/tempfile.tmp
date | sed -e "s/.*/# Created: &/g" >> /tmp/tempfile.tmp
date | sed "s/\(.*\)\([0-9][0-9][0-9][0-9]\)/# Copyright (c) \2 Frederick S. Ziegler/" >> /tmp/tempfile.tmp
hostname | sed -e "s/.*/# Source Machine: &/g" >> /tmp/tempfile.tmp
cat ./install_apps.sh >> /tmp/tempfile.tmp
mv /tmp/tempfile.tmp ./install_apps.sh

sed -e "s/sudo apt-get install -y $//g" ./install_apps.sh > /tmp/tempfile.tmp
mv /tmp/tempfile.tmp ./install_apps.sh

echo "sudo apt-get update" >> ./install_apps.sh

chmod "+x" ./install_apps.sh
