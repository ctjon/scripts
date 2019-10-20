while [ true ]
do
	cat /proc/mdstat |grep recovery
	sleep 60
done
