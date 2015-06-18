#!/bin/bash

. /root/scripts/env.sh

/usr/bin/find ${WWW_DIR} -type f -mtime -1 -print | /bin/egrep -v ${EXCLUDED_PATHS} > ${LOG_DIR}/mailbody_$DATE.txt

FILE_LENGHT=`cat ${LOG_DIR}/mailbody_$DATE.txt | wc -l`
if [ ${FILE_LENGHT} -gt "0" ]; then
    /bin/cat ${LOG_DIR}/mailbody_$DATE.txt | /usr/bin/mail -s "${SUBJECT}" -a "From: ${FROM}" ${TO}
fi
