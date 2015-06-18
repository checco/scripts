#!/bin/bash

. /root/scripts/env.sh

echo >> $BADFILE_LOG && /bin/date >> $BADFILE_LOG
echo "Start scan on ${WWW_DIR}" >> $BADFILE_LOG
/usr/bin/find ${WWW_DIR} -type f | /bin/grep "uploads" | /bin/egrep "upload.php|plugin.php|blog.php" > ${BADFILE_TMPLOG}
num=`cat ${BADFILE_TMPLOG} | wc -l`

[ ${num} -eq "0" ] && echo >> $BADFILE_LOG && /bin/date >> $BADFILE_LOG && echo "There are no bad files to delete" >> $BADFILE_LOG && exit 

cd ${WWW_DIR}
echo >> $BADFILE_LOG && /bin/date >> $BADFILE_LOG && echo >> $BADFILE_LOG
for file in `cat ${BADFILE_TMPLOG}`; do
  echo -en "Remove file ${file}.. " >> ${BADFILE_LOG}
  #rm -f $file 
  echo -en "done\n" >> ${BADFILE_LOG}
done

