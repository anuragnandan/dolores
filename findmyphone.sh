#!/bin/bash

if [ ! -f .env ];
then
	echo "No .env file found."
	exit 1
fi

`export $(cat .env | /usr/bin/xargs)`
SUBNET=`ip addr show | /bin/grep eth0 | /bin/grep inet | awk -F " " {'print $2'}`

PATTERN=${MAC_ADDRESS//,/\\|}

PATH=$(/usr/bin/dirname "$0")
if [ -z "$PATTERN" ]
then
	echo "Needs an argument (MAC Address of the device) of the device to detect if it is home or connected."
	exit 1
fi
while [ 1 ]; do
	echo "Scanning for $PATTERN availability."
        OUT=`/usr/bin/sudo nmap -p 5353 -sV -O $SUBNET | /bin/grep $PATTERN`
        if [ -z "$OUT" ]
                then
			echo "Not found. Sleeping\n"
			`/bin/sleep 5`
       		else
			echo "Found\n"
			`/bin/sleep 3`
			`/usr/bin/sudo php $PATH/youtube-castnow.php & > /dev/null &`
		exit 1
 fi
done
