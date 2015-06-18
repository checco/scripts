#!/bin/bash

file_log="/tmp/badfile.log"
log="/root/scripts/log/findbadfile.log"
echo >> $log && /bin/date >> $log
echo "Start scan on /home/admin/domains/" >> $log
/usr/bin/find /home/admin/domains/ -type f | /bin/grep "uploads" | /bin/egrep "upload.php|plugin.php|blog.php" > ${file_log}
num=`cat ${file_log} | wc -l`

[ ${num} -eq "0" ] && echo >> $log && /bin/date >> $log && echo "There are no bad files to delete" >> $log && exit 

cd /home/admin/domains/
echo >> $log && /bin/date >> $log && echo >> $log
for file in `cat ${file_log}`; do
  echo -en "Remove file ${file}.. " >> ${log}
  #rm -f $file 
  echo -en "done\n" >> ${log}
done

