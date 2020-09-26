  
#!/bin/sh

YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[1;34m'
SET='\033[0m'

# Delete originale file
rm -rf CurrentRebootTimes
rm -rf TotalRebootTimes
rm -rf enableRebootTime

SCRIPT_PATH=`pwd`
echo The script path is $SCRIPT_PATH

touch enableRebootTime

# Create a crontab job using bash without the interactive editor
rm -rf mycron
# Remove cron jobs
echo "Remove crontab job...\n"
sudo crontab -r
# Create crontab job
echo "Create a crontab job...\n"
sudo crontab -l > mycron
echo "*/2 * * * * cd ${SCRIPT_PATH} && ./autoRebootForCron.sh\n" >> mycron
sudo crontab mycron
# Check the crontab job
sudo crontab -l

# echo "# Please add command to crontab by...\n"
# echo "$ sudo crontab -e\n"
# echo "*/2 * * * * cd ${SCRIPT_PATH} && ./autoRebootForCron.sh #For reboot every 2 minutes...\n"
echo "### Modify the reboot time Var declare -i time=20 in autoRebootForCron.sh###"
echo "### Execute command below to set Autoreboot times and start reboot...###\n"
echo "$ sudo ./autoRebootForCron.sh\n"

echo "$ service cron start\n"
echo "# Stop test by...\n"
echo "$ service cron stop\n"


