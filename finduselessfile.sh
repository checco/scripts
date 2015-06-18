#!/bin/bash

. /root/scripts/env.sh

echo > $USELESSFILE_LOG && /bin/date >> $USELESSFILE_LOG
echo "Start scan on $WWW_DIR" >> $USELESSFILE_LOG
/usr/bin/find $WWW_DIR -type f | /bin/egrep "LEGGIMI.txt|licenza.html|wp-config-sample.php|readme.html|license.txt" > ${USELESSFILE_TMPLOG}
num=`cat ${USELESSFILE_TMPLOG} | wc -l`

[ ${num} -eq "0" ] && echo >> $USELESSFILE_LOG && /bin/date >> $USELESSFILE_LOG && echo "There are no files to delete" >> $USELESSFILE_LOG && exit 

cd $WWW_DIR
echo >> $USELESSFILE_LOG && /bin/date >> $USELESSFILE_LOG && echo >> $USELESSFILE_LOG
for file in `cat ${USELESSFILE_TMPLOG}`; do
  echo -en "Remove file ${file}.. " >> ${USELESSFILE_LOG}
  rm -f ${file}
  echo -en "done\n" >> ${USELESSFILE_LOG}
done

