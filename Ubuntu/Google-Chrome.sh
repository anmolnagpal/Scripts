#!/bin/bash
# Shell script   
#   "Google-Chrome"       
# -------------------------------------------------------------------------
# Version 1.0 (Aug 04 2015)
# -------------------------------------------------------------------------
# Copyright (c) 2013 AnmolNagpal <http://www.tweakntip.com>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable