#!/bin/bash
echo See "https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-14-04" \
for instructions on configuring a mail server
read -n 1 -s
sudo apt-get -y install mailutils
sudo nano /etc/postfix/main.cf
sudo service postfix restart
echo "This is the body of the email" | mail -s "This is the subject line" [your email]@gmail.com
