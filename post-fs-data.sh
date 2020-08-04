#!/system/bin/sh
# Written by Draco (tytydraco @ GitHub)

UPCOUNT=0
DOWNCOUNT=0
while true
do
	if [[ $UPCOUNT -ge 3 ]]
	then
		touch "/data/cache/.disable_magisk"
		reboot
	fi

	if [[ $DOWNCOUNT -ge 3 ]]
	then
		rm "/data/cache/.disable_magisk"
		reboot
	fi

	EVENT=`getevent -q -l -c 1`

	[[ `cat /proc/uptime | awk '{print $1}' | awk -F. '{print $1}'` -ge 10 ]] && exit 0

	echo "$EVENT" | grep KEY_VOLUMEDOWN | grep DOWN &&
		DOWNCOUNT=$(($DOWNCOUNT + 1))
	echo "$EVENT" | grep KEY_VOLUMEUP | grep DOWN &&
		UPCOUNT=$(($UPCOUNT + 1))
done
