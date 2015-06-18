#!/bin/bash

[ "$1" == "" ] && echo "Please submit a parameter like: open or close" && exit 1

. /root/scripts/env.sh

if [ "$1" == "open" ]; then
  cp -f ${openfw} ${configfw}
  /sbin/iptables-restore /etc/firewall.conf
  echo "FTP is open on firewall"
elif [ "$1" == "close" ]; then
  cp -f ${closefw} ${configfw}
  /sbin/iptables-restore /etc/firewall.conf
  echo "FTP is closed on firewall"
else
  echo "Please submit a parameter like: open or close" && exit 1
fi
