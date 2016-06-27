Configure EC2 for LAMP Usage
============================

A typical LAMP application runs Linux, an Apache web server, a MySQL database, and PHP for server-side scripting
 * Start an Ubuntu (or other Debian) Linux instance on Amazon AWS (or other cloud provider).
  * The security settings should include opening ports 80 (HTTP), 22 (SSH), and 443 (HTTPS)
  * Make sure your VPC has "DNS Hostnames" enabled
 * SSH into this instance from Linux
  * `ssh -i "[path to *.pem file].pem" ubuntu@[IP address of instance]`
 * **Commands to perform entire installation:** `sudo apt-get update; sudo apt-get -y install git; mkdir web; cd web; git clone https://github.com/fsziegler/Configurations.git; cd Configurations; sudo ./setup_lamp.sh
`

_Detailed break-out of commands:_
 * Perform system update & install git: `sudo apt-get update; sudo apt-get -y install git`
 * Create and change to a web directory
  * `mkdir web; cd web`
 * Clone this Git repo & change to its directory: `git clone https://github.com/fsziegler/Configurations.git; cd Configurations`
 * Install LAMP applications:
  * `sudo ./setup_lamp.sh`
    * You must create a password for the MySQL server when prompted
    * You must check "apache2" for the phpmyadmin web interface when prompted for "Web server to reconfigure automatically"
    * Click on "Yes" when prompted "Configure database for phpmyadmin with dbconfig-common?"
    * You must enter the MySQL password for phpmyadmin
    * You must create a password for phpmyadmin when prompted "MySQL application password for phpmyadmin:"

Once these installations are complete, you should be able to browse to your instance's IP address and see the "Apache2 Ubuntu Default Page". If you append '/phpmyadmin' to the IP address, you should see the "Welcome to phpMyAdmin" page. The user name is root, and the password is whatever you entered when you ran `setup_lamp.sh`.
 
From: http://blog.netgusto.com/solving-web-file-permissions-problem-once-and-for-all/

Assume that the developer user is `fred`, the web server user is `www-data` and the application is stored at `/var/www/html/app1` (created by root).
 * Run as root `su`
 * `sudo apt-get update`
 * `sudo apt-get -y install bindfs`
 * `mkdir -p /home/fred/websites/app1`
 * `sudo nano /etc/fstab`
   * Append `bindfs#/var/www/html/app1 /home/fred/websites/app1 fuse force-user=fred,force-group=fred,create-for-user=www-data,create-for-group=www-data,create-with-perms=0770,chgrp-ignore,chown-ignore,chmod-ignore 0 0` & save & close
 * `mount /home/fred/websites/app1` (system will do this at boot time)

To have a PHP script run an executable that communicates with another executable on the server, such as the interprocess communication client (kicked off by the script) talking to the ipc server in https://github.com/fsziegler/cs-ipc:
 * Assume the root password is `foo123`, and the client and server are run using `boost-ipc001 -c` and `boost-ipc001 -s &`, respectively
 * run the server: `sudo -u www-data ./boost-ipc001 -s &`
   * Note that `www-data` is the default apache account name
 * run_client.php:
```
<?php // send_report.php
   if (isset($_POST['url']))
   {
      $command = "echo foo123 | sudo -S ./boost-ipc001 -c > result.txt";
      shell_exec($command);
   }
?>
```
   * The client mode program spawned by the PHP script by the apache server will communicate with the server moce program run from the command line.
   * The client and server programs will NOT communicate if they are run by different user accounts
