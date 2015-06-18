#!/bin/bash

[ "$1" == "" ] && echo "Please submit a parameter like: open or close" && exit 1

config="/etc/firewall.conf"
openfw="/etc/firewall.conf-ftp_opened"
closefw="/etc/firewall.conf-ftp_closed"

if [ "$1" == "open" ]; then
  cp -f ${openfw} ${config}
  /sbin/iptables-restore /etc/firewall.conf
  echo "FTP is open on firewall"
elif [ "$1" == "close" ]; then
  cp -f ${closefw} ${config}
  /sbin/iptables-restore /etc/firewall.conf
  echo "FTP is closed on firewall"
else
  echo "Please submit a parameter like: open or close" && exit 1
fi
