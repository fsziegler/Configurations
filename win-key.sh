#!/bin/bash
# 
# Script & instructions for mapping the Windows key to the Kubuntu Start menu
#
# Copied from "http://cvalcarcel.wordpress.com/2012/01/07/kubuntu-11-10-mapping-\
#              the-windows-key-to-activate-kmenu/"
#
# Copy date: 2014-06-20
# 
# 1. Open a termainal console
#
# 2. Find the key to which Super_L (the Windows key comes up as Super_L) is 
#    mapped by running xev (it will open a small window that waits for your 
#    keyboard input and displays it in the console window where xev was started. 
#    Closing the window will cause xev to terminate)
#    > xev | grep Super_L
#    state 0x0, keycode 133 (keysym 0xffeb, Super_L), same_screen YES,
#    state 0x40, keycode 133 (keysym 0xffeb, Super_L), same_screen YES,
# 
# 3. Place THIS script file (win-key.sh) under ~/.kde/Autostart
xmodmap -e 'keycode 133 = F13'

# 4. Make THIS script file (win-key.sh) executable:
#    > chmod +x ~/.kde/Autostart/win-key.sh
# 5. Execute the script manually (it will be executed every time you restart)
#    > ~/.kde/Autostart/win-key.sh
#
# 6. Confirm the keycode has been mapped to F13
#   > xev | grep F13
#   state 0x0, keycode 133 (keysym 0xffca, F13), same_screen YES,
#   state 0x40, keycode 133 (keysym 0xffca, F13), same_screen YES,
#
# 7. KMenu –> Search: Global Keyboard Shortcuts –> KDE Component: 
#    Plasma Desktop Shell –> Activate Application Launcher Widget –> 
#    Custom (Click None)
#    Press the Windows Key and None should change to F13
#
# 8. Click OK.
