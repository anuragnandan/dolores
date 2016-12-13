#!/bin/sh
#Run this process to find your phone. This process takes an argument to search for a pattern over all the devices connected devices to the wifi router.
#Giving the mac address of the phone is suggested.

COUNT=`/bin/ps -ef | /bin/grep findmyphone | wc | awk -F " " '{print $1}'`
if [ $COUNT -gt 4 ]
then
  echo "Already running previous instancet"
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
  OUT=`/usr/bin/sudo nmap -p 5353 -sV -O $SUBNET | /bin/grep $PATTERN`

  if [ -z "$OUT" ]
  then
    echo "Not found.\n"
		`/bin/sleep 5`
  else
    echo "Found.\n"
    `/usr/bin/sudo php $PATH/youtube-castnow.php & > /dev/null`
    exit 1
fi
done
