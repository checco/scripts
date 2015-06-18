#!/bin/bash

. env.sh

/usr/bin/mysqlcheck -u ${USER} -p${PASSWD} --repair --all-databases
