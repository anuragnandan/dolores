#!/bin/sh
#Run this process to find your phone. This process takes an argument to search for a pattern over all the devices connected devices to the wifi router.
#Giving the mac address of the phone is suggested.

COUNT=`/bin/ps -ef | /bin/grep findmyphone | wc | awk -F " " '{print $1}'`
if [ $COUNT -gt 3 ]
then
  echo "Already running previous instance. Exiting."
	exit 1
fi

SUBNET=`ip addr show | grep eth0 | grep inet | awk -F " " {'print $2'}`
PATH=`pwd`
PATTERN="$1"
if [ $PATTERN -eq "" ]
then
  echo "No pattern given to search. Requires an argument for searching"
  exit 1
fi

while [ 1 ]; do
  `/usr/bin/sudo nmap -p 5353 -sV -O $SUBNET | /bin/grep \'$PATTERN\'`

  if [ $? -eq 0 ]
  then
    `/usr/bin/sudo php $PATH/youtube-castnow.php &`
    exit 1
	else
		`/bin/sleep 5`
  fi
done
