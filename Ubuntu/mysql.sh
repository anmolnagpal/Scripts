#!/bin/bash
# Shell script   
#   "mysql"       
# -------------------------------------------------------------------------
# Version 1.0 (Aug 04 2015)
# -------------------------------------------------------------------------
# Copyright (c) 2013 AnmolNagpal <http://www.tweakntip.com>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
echo mysql-server-5.1 mysql-server/root_password password root| debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password root| debconf-set-selections
sudo apt-get install -y mysql-server