#!/bin/bash

NUM=`/bin/ps -ef | /bin/grep -i mysql | /bin/egrep -v "grep|\.sh|tail|less" | /usr/bin/wc -l`
LOG="/root/scripts/log/mysql_status.log"

if [ ${NUM} -gt 1 ]; then
  /bin/echo "MySQL is running"
else
  date >> $LOG
  /bin/echo "MySQL is down" >> $LOG
  /usr/sbin/service mysqld start && echo "MySQL started" >> $LOG
  /bin/echo "Repair all the databases" >> $LOG
  /root/scripts/mysql_repair.sh 2>&1 > /dev/null
  /bin/echo "Databases repaired" >> $LOG
fi
