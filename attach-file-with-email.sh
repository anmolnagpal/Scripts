 #####################
 #!/bin/bash

 set -x;
 
 DIR_PATH=/home/anmol
 Email_body=/var/www/html/email.txt
 current_date=`date +%m%d%Y` 
 cd $DIR_PATH;
 Total_Files=`ls -lrt *.json | wc -l`
 If [ "$Total_Files" -ne "0" ]; then
 
 ls -lrt *.json | awk '{ print $9 }' > sent_mail.txt
 
while IFS= read -r line
do
mutt -s "Json new file created - "current_date"" -a $DIR_PATH/$line -- anmolnagpal@tweakntip.com < $Email_body;

#rename the file name_of_file_DONE_CURRENT_DATE

mv $line $line_DONE_"$current_date"

done <sent_mail.txt
