#!/bin/bash

. /root/scripts/env.sh

/usr/bin/mysqlcheck -u ${USER} -p${PASSWD} --repair --all-databases
