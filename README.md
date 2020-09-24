# Autoreboot_Crontab

Steps,
# to install file in this script path
1. sudo ./install.sh

# add command that will auto execute by crontab
2. sudo crontab -e # add following link to crontab. For reboot, it need to run with "$ sudo crontab -e"
*/2 * * * * cd /home/u1804/Autoreboot_Crontab && ./autoRebootForCron.sh

# start Autoreboot with setting times or you can edit the times in autoRebootForCron.sh
3. sudo autoRebootForCron.sh $times


# useful command to stop
$ service cron start /stop /restart
