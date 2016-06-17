Configure EC2 for LAMP Usage
============================

A typical LAMP application runs Linux, an Apache web server, a MySQL database, and PHP for server-side scripting
 * Start an Ubuntu (or other Debian) Linux instance on Amazon AWS (or other cloud provider).
  * The security settings should include opening ports 80 (HTTP), 22 (SSH), 3306 (MySQL), and 443 (HTTPS)
 * SSH into this instance from Linux
  * `ssh -i "[path to *.pem file].pem" ubuntu@[IP address of instance]`
 * Perform system update: `sudo apt-get update`
 * Install git: `sudo apt-get -y install git`
 * Create and change to a web directory
  * `mkdir web`
  * `cd web`
 * Clone this Git repo: `git clone https://github.com/fsziegler/Configurations.git`
 * Change to the Configurations directory: `cd Configurations`
 * Install development and LAMP applications:
  * `sudo ./setup_dev.sh`
  * `sudo ./setup_lamp.sh`
   * You must create a password for the MySQL server when prompted
   * You must create a password for the phpmyadmin web interface when prompted
   * You must select "apache" for the phpmyadmin web interface when prompted

Once these installations are complete, you should be able to browse to your instance's IP address and see the "Apache2 Ubuntu Default Page". If you append '/phpmyadmin' to the IP address, you should see the "Welcome to phpMyAdmin" page. The user name is root, and the password is whatever you entered when you ran `setup_lamp.sh`.
 
 
