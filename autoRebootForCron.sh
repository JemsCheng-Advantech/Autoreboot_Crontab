#!/bin/bash

SCRIPT_PATH=`pwd`

if [ -z $1]
then
	declare -i time=20
else
	declare -i time=$1
fi

## Main Function

## CurrentRebootTimes: how many times the Autoreboot has executed
## TotalRebootTimes: The setting you set for Autoreboot
## enableRebootTimes: On/Off to start the below script

[ -e ${SCRIPT_PATH}/enableRebootTime ] && {
	echo $time > ${SCRIPT_PATH}/TotalRebootTimes
	declare -i enableRebootTime=$(cat ${SCRIPT_PATH}/enableRebootTime)
	echo "$[ $enableRebootTime+1 ]" > ${SCRIPT_PATH}/enableRebootTime
	echo $enableRebootTime > ${SCRIPT_PATH}/CurrentRebootTimes
	/sbin/reboot
	if [ $enableRebootTime -eq $time ]
	then
		rm ${SCRIPT_PATH}/enableRebootTime
	fi
	
}
