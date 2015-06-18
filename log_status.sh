#!/bin/bash

tail -f /var/log/mysql/mysql_error.log ~/scripts/log/mysql_status.log /var/log/syslog /var/log/exim/mainlog
