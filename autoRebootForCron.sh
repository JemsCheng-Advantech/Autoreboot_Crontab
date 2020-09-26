#!/bin/bash

SCRIPT_PATH=`pwd`

if [ -z $1]
then
	## set the reboot times here
	declare -i time=10
else
	## input the reboot time by ./autoRebootForCron.sh $time
	declare -i time=$1
fi

## Main Function
## CurrentRebootTimes: how many times the Autoreboot has executed
## TotalRebootTimes: The setting you set for Autoreboot
## enableRebootTimes: On/Off to start the below script

[ -e ${SCRIPT_PATH}/enableRebootTime ] && {
	# Check enableRebootTime file is there and set the $time to TotalRebootTimes
	echo $time > ${SCRIPT_PATH}/TotalRebootTimes

	# Set enableRebootTime Var
	declare -i enableRebootTime=$(cat ${SCRIPT_PATH}/enableRebootTime)

	# The enableRebootTime will be add 1 when every reboot and execution this file
	echo "$[ $enableRebootTime+1 ]" > ${SCRIPT_PATH}/enableRebootTime

	# Print the current boot time to CurrentRebootTimes
	echo $enableRebootTime > ${SCRIPT_PATH}/CurrentRebootTimes
	
	
	echo "The Reboot times you set is... $time"
	echo "The Currect boot time is... $enableRebootTime"
	#sleep 5

	if [ $enableRebootTime -eq $time ]
	then
		rm ${SCRIPT_PATH}/enableRebootTime
		sudo crontab -r
	fi
	# Execution reboot
	/sbin/reboot
	
}
