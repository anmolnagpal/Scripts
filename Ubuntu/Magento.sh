#!/bin/bash
# Shell script to install All  dependencies for Monsoon Consulting 
#		"Magento Developer Machine" 			
# -------------------------------------------------------------------------
# Version 1.0 (May 10 2015)
# -------------------------------------------------------------------------
# Copyright (c) 2013 Anmol Nagpal <http://www.tweakntip.in>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------

#Tools Installed
# Adduser (Admin)
# Nginx 
# PHP5
# MySQL
# phpMyAdmin
# Java
# Browser (Opera Safari(Wine) chromium Chrome)
# Teamviewer
# Skype
# Elance Tracker
# Firewall Disable
# Other's (vim, VLC, Xpad, geany, Shutter )
# Copy
# PAC
#

if ! [ $(id -u) = 0 ]; then
   echo "Please login via root!"
   exit 1

else

apt-get update

# Add User to www-data
usermod -a -G www-data username

# Add New User for Admin 

	 username=Anmol
	 password=samsung

if [ $(id -u) -eq 0 ]; then


	#read -s -p "Enter password : " $password

	egrep "^$username" /etc/passwd >/dev/null

	if [ $? -eq 0 ]; then

		echo "$username exists!"

		exit 1

	else

		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)

		useradd -m -p $pass $username

		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"

	fi

else

	echo "Only root may add a user to the system"

	exit 2


fi

# Git Tool's
sudo apt-get install gitg -y

# Version Control GIT
apt-get install git -y
apt-get install gitg -y
apt-get install gitk -y

# Nginx
apt-get install -y nginx
service nginx restart

# PHP 5
apt-get install -y php5 php5-fpm php5-curl php5-intl php5-mcrypt php5-memcache php5-memcached php5-devel php5-mysql php5-gd php5-xdebug

# Firewall Disabled
service ufw disable			

# Other utils
apt-get install -y coffeescript ruby-compass
apt-get install gnome-system-tools -y
apt-get install dconf-tools -y
apt-get install ssh -y
apt-get install filezilla -y #ftp client
apt-get install htop -y # network tool
apt-get install vim -y # editor
apt-get install diffuse -y # compare file
apt-get install bmon -y
apt-get install meld -y # compare tool
apt-get install wine -y #Wine
apt-get install xpad -y # Xpad
apt-get install shutter -y # Screen Shot Tool

# JAVA
apt-get install openjdk-7-jre -y
apt-get install openjdk-6-jre -y

# Browser
apt-get install chromium-browser -y

# MySQL
echo mysql-server-5.1 mysql-server/root_password password root| debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password root| debconf-set-selections
sudo apt-get install -y mysql-server

# Skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install skype -y

# Copy

sudo add-apt-repository ppa:paolorotolo/copy
sudo apt-get update
sudo apt-get install copy

# Upgrade Ubuntu
sudo apt-get upgrade -y

# phpMyAdmin
sudo apt-get install phpmyadmin -y 

# Pac
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
sudo apt-get update
sudo apt-get install pac -y

#Ngios
sudo apt-get install -y openssl nagios-nrpe-server nagios-plugins nagios-plugins-basic nagios-plugins-standard
sudo /etc/init.d/nagios-nrpe-server restart

# Team Viewer

# install required libs
RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -ge 1310 ]; then
  sudo apt-get install -y libxtst6:i386
  sudo apt-get install -y gcc-4.8-base:i386
  sudo apt-get install -y libc6:i386
  sudo apt-get install -y libgcc1:i386
  sudo apt-get install -y libx11-6:i386
  sudo apt-get install -y libxau6:i386  
  sudo apt-get install -y libxcb1:i386
  sudo apt-get install -y libxdmcp6:i386
  sudo apt-get install -y libxext6:i386 
  sudo apt-get install -y libjpeg62:i386
  sudo apt-get install -y libxinerama1:i386
else
  sudo apt-get install -y libc6-i386 lib32asound2 lib32z1 ia32-libs
fi
if [ "$(uname -m)" == "x86_64" -a ${RELEASE} -lt 1310 ]; then
  # 64 bit
  URL=http://download.teamviewer.com/download/teamviewer_amd64.deb
else
  # 32 bit
  URL=http://download.teamviewer.com/download/teamviewer_i386.deb
fi
# download
wget -q ${URL} -P /tmp
# install
sudo dpkg -i /tmp/teamviewer_*.deb
# fix possible installation errors
sudo apt-get install -f -y
# clean up
rm /tmp/teamviewer_*.deb
fi