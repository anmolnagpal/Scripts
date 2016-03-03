#!/bin/bash
# Shell script to install All  dependencies for YO
#		"Developer Machine" 			
# -------------------------------------------------------------------------
# Version 1.0 (May 10 2015)
# -------------------------------------------------------------------------
# Copyright (c) 2013 Anmol Nagpal <http://www.anmolnagpal.com>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------

#Tools Installed
# Adduser (Admin)
# Apache2 
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
# Apache 2
apt-get install -y apache2 libapache2-mod-xsendfile apache2-mpm-itk
a2enmod rewrite
service apache2 restart

# PHP 5
apt-get install -y php5 php5-curl php5-intl php5-mcrypt php5-memcache php5-memcached php5-devel php5-mysql php5-gd php5-xdebug

# MySQL
echo mysql-server-5.1 mysql-server/root_password password root| debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password root| debconf-set-selections
sudo apt-get install -y mysql-server

# Firewall Disabled
ufw disable	

# Skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update -y
sudo apt-get install skype -y

# JAVA
apt-get install openjdk-7-jre -y
apt-get install openjdk-6-jre -y

# Browser
apt-get install chromium-browser -y

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

#Other Tools
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
sudo apt-get install vim -y # Editor
sudo apt-get install geany -y #Editor


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

#Elance Tracket
apt-get install libgtk2.0-0:i386 libstdc++6:i386 libnss3-1d:i386 lib32nss-mdns libxml2:i386 libxslt1.1:i386 libcanberra-gtk-module:i386 gtk2-engines-murrine:i386
cd /tmp
apt-get download libgnome-keyring0:i386
dpkg-deb -R libgnome-keyring0_3.8.0-2_i386.deb gnome-keyring
cp gnome-keyring/usr/lib/i386-linux-gnu/libgnome-keyring.so.0.2.0 /usr/lib/i386-linux-gnu/
ln -s /usr/lib/i386-linux-gnu/libgnome-keyring.so.0.2.0 /usr/lib/i386-linux-gnu/libgnome-keyring.so.0
ln -s /usr/lib/i386-linux-gnu/libgnome-keyring.so.0 /usr/lib/libgnome-keyring.so.0
ln -s /usr/lib/i386-linux-gnu/libgnome-keyring.so.0.2.0 /usr/lib/libgnome-keyring.so.0.2.0
wget http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRInstaller.bin
chmod a+x AdobeAIRInstaller.bin
./AdobeAIRInstaller.bin
rm ./AdobeAIRInstaller.bin
rm /usr/lib/libgnome-keyring.so.0
rm /usr/lib/libgnome-keyring.so.0.2.0
wget https://www.elance.com/tracker/TrackerSetup.deb
dpkg -i TrackerSetup.deb

## phpMyAdmin
sudo apt-get  install phpmyadmin

# Firewall Disabled
service ufw disable  

# Upgrade Ubuntu
sudo apt-get upgrade -y 
fi
