#!/bin/bash
# Shell script   
#   "Skype Install"       
# -------------------------------------------------------------------------
# Version 1.0 (Aug 04 2015)
# -------------------------------------------------------------------------
# Copyright (c) 2013 AnmolNagpal <http://www.tweakntip.com>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update -y
sudo apt-get install skype -y
