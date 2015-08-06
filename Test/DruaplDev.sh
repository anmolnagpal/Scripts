#!/bin/bash
# Shell script to install All  dependencies for 
#		"Developer Machine" 			
# -------------------------------------------------------------------------
# Version 1.0 (Sep 24 2013)
# -------------------------------------------------------------------------
# Copyright (c) 2013 Anmol Nagpal <http://www.tweakntip.in>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------

if ! [ $(id -u) = 0 ]; then
   echo "Please login via root!"
   exit 1

else

apt-get update

# Add User to www-data
usermod -a -G www-data username

# Add New User for Admin 

	 username=admin
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
sudo apt-get install gitg

# Version Control SVN
apt-get install subversion -y

# Version Control GIT
apt-get install git -y
apt-get install gitg -y
apt-get install gitk -y

# Apache 2
apt-get install -y apache2 libapache2-mod-xsendfile apache2-mpm-itk
a2enmod rewrite
service apache2 restart

# PHP 5
apt-get install -y php5 php5-curl php5-intl php5-mcrypt php5-memcache php5-memcached php5-devel php5-mysql php5-gd php5-xdebug

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

# JAVA
apt-get install openjdk-7-jre -y
apt-get install openjdk-6-jre -y

# Browser
apt-get install chromium-browser -
# Google-Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
##Opera
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-get update && sudo apt-get install opera -y
#Safari
# install wine
sudo apt-get install -y wine 
# create download and build directory
mkdir -p ~/build/safari
cd  ~/build/safari
# download
wget http://appldnld.apple.com/Safari5/041-5487.20120509.INU8B/SafariSetup.exe
# wine
wine SafariSetup.exe

# MySQL
echo mysql-server-5.1 mysql-server/root_password password root| debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password root| debconf-set-selections
sudo apt-get install -y mysql-server

# Skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install skype -y


# phpMyAdmin
sudo apt-get install phpmyadmin -y 

#htop network monitoring tool for Developer Machine # via http://ipaddress:3000
sudo apt-get install ntop -y 
sudo /etc/init.d/ntop -i eth0 start

##Teamviewer
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


# Upgrade Ubuntu
sudo apt-get upgrade -y
