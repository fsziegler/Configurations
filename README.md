Configurations
==============

This repository contains configurations and configuration utilities for [K]Ubuntu installations
 * `.bashrc` - version of .bashrc that implements a formatted and colored command prompt, plus a single alias to add, commit, and push a git change.
 * `gen_install_apps.sh` - a script that generates an installation script, `install_apps.sh`, for every Debian-reported application on a Debian Linux systems. This can be used to install all of these applications on another Debian installation.
 * `win-key.sh` - a script that is used, along with the instructions contained in it, to map the "Windows" key to the Kubuntu "Kickoff" menu.
 * `setup_dev.sh` - a script that installs much of the software required in a new Kubuntu installation for doing software development.
 * gEdit has an annoying behavior: for every file opened, it opens another blank file where you must select "Close without Saving" in order to close it. To disable this:
  * Right-click on the "Kickoff Application Launcher" (icon with a gear and a "K" at the lower left of the screen)
  * Select "Edit Applications"
  * Expand "Utilities" in the list on the left
  * Click on gEdit
  * In the "Command" field, replace `gedit %U` with `gedit $1 < /dev/null`
  * Click "Save"
  * Close the KDE Menu Editor
