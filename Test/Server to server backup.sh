##############################################################
#!/bin/bash
username=anmol
ip=192.168.2.1

bkdate=$(date +%Y%m%d)
mkdir /var/www/$bkdate 
echo "Processing..."
scp -P 2020 $username@$ip:/home/anmol/backup/*.sql.gz /var/www/$bkdate 
echo "System Restarted" | sendmail -v anmolnagpal@tweakntip.com
echo "Success"
##############################################################
#!/bin/bash
username=anmol
ip=80.93.26.154

bkdate=$(date +%Y%m%d)
mkdir /var/www/$bkdate 
echo "Processing..."
scp -P 2020 $username@$ip:/home/anmol/backup/*.sql.gz /var/www/$bkdate 
echo "System Restarted" | sendmail -v anmolnagpal@tweakntip.com
echo "Success"
##############################################################


