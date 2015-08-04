#!/bin/bash
# Shell script to install 
#		"Safari" 			
# -------------------------------------------------------------------------
# Version 1.0 (May 10 2015)
# -------------------------------------------------------------------------
# Copyright (c) 2013 Anmol Nagpal <http://www.tweakntip.in>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
#
# install wine
sudo apt-get install -y wine 
# create download and build directory
mkdir -p ~/build/safari
cd  ~/build/safari
# download
wget http://appldnld.apple.com/Safari5/041-5487.20120509.INU8B/SafariSetup.exe
# wine
wine SafariSetup.exe