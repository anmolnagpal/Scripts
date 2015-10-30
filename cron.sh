#!/bin/bash
RUN_PROCESS=`ps -ef | grep -i cron.php | wc -l`
if [ $RUN_PROCESS -ge 0 ]
then
   echo "Cron Hanged" | sendmail -v monsoon.anmol.nagpal@gmail.com
fi