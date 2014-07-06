#!/bin/sh
#
# Written 2011-09-20 by Fred Ziegler
# Copyright © 2011, Frederick S. Ziegler
# All rights reserved.
#
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
