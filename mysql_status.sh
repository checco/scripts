#!/bin/bash

.env.sh 

if [ ${MYSQL_PROC_NUM} -gt 1 ]; then
  /bin/echo "MySQL is running"
else
  date >> $MYSQL_STATUS_LOG
  /bin/echo "MySQL is down" >> $MYSQL_STATUS_LOG
  /usr/sbin/service mysqld start && echo "MySQL started" >> $MYSQL_STATUS_LOG
  /bin/echo "Repair all the databases" >> $MYSQL_STATUS_LOG
  /root/scripts/mysql_repair.sh 2>&1 > /dev/null
  /bin/echo "Databases repaired" >> $MYSQL_STATUS_LOG
fi
