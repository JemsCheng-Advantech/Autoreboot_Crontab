#!/bin/bash

##SCRIPT_PATH=`pwd`

if [ -z $1]
then
	declare -i time=20
else
	declare -i time=$1
fi

## Main Function
[ -e /home/u1804/Autoreboot/enableRebootTime ] && {
	echo $time > /home/u1804/Autoreboot/TotalRebootTimes
	declare -i enableRebootTime=$(cat /home/u1804/Autoreboot/enableRebootTime)
	echo "$[ $enableRebootTime+1 ]" > /home/u1804/Autoreboot/enableRebootTime
	echo $enableRebootTime > /home/u1804/Autoreboot/CurrentRebootTimes
	/sbin/reboot
	if [ $enableRebootTime -eq $time ]
	then
		rm /home/u1804/Autoreboot/enableRebootTime
	fi
	
}
