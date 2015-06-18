#!/bin/bash

### Script environment
DATE=`date +'%Y%m%d'`
WWW_DIR="/home/admin/domains"
LOG_DIR="/root/scripts/log"
EXCLUDED_PATHS=".git|log|cache/db|cache/object|cache/timthumb|cache/page_enhanced|cache/minify"

### Mail environment
SUBJECT="[INFO] Found changed files"
FROM="monitor@altdesign.it"
TO="niki.rocco@gmail.com"

/usr/bin/find ${WWW_DIR} -type f -mtime -1 -print | /bin/grep -v ${EXCLUDED_PATHS} > ${LOG_DIR}/mailbody_$DATE.txt

FILE_LENGHT=`cat ${LOG_DIR}/mailbody_$DATE.txt | wc -l`
if [ ${FILE_LENGHT} -gt "0" ]; then
    /bin/cat ${LOG_DIR}/mailbody_$DATE.txt | /usr/bin/mail -s "${SUBJECT}" -a "From: ${FROM}" ${TO}
fi
