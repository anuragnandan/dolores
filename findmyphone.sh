#!/bin/sh

`/bin/ps -ef | /bin/grep findmyphone | /bin/grep -v grep`
if [ $? -eq 1 ]
	then
	exit 1
fi

SUBNET=`ip addr show | grep eth0 | grep inet | awk -F " " {'print $2'}`
PATH=`pwd`
PATTERN="$1"

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
