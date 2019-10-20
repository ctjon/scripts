#!/bin/sh
#
/bin/date

DAY=`/bin/date +%w`
case $DAY in
0)
	export WEEKDAY=0-sun
	;;
1)
	export WEEKDAY=1-mon
	;;
2)
	export WEEKDAY=2-tue
	;;
3)
	export WEEKDAY=3-wed
	;;
4)
	export WEEKDAY=4-thu
	;;
5)
	export WEEKDAY=5-fri
	;;
6)
	export WEEKDAY=6-sat
	;;
esac

export SRCDIR=/
export TGTDIR=/export/backups/root-backups
mkdir -p $TGTDIR
echo "********************************************************************************"
echo "* rsyncing system to $TGTDIR"
echo "********************************************************************************"

rsync -aHKvz --keep-dirlinks --delete-during --progress --delete-excluded \
--include='/var/named/' \
--include='/var/spool/cron/' \
--exclude='tmp-*' \
--exclude='/var/*' \
--exclude='/bin' \
--exclude='/dev' \
--exclude='/export' \
--exclude='/lib' \
--exclude='/lib64' \
--exclude='/media' \
--exclude='/mnt' \
--exclude='/opt' \
--exclude='/proc' \
--exclude='/run' \
--exclude='/sbin' \
--exclude='/srv' \
--exclude='/sys' \
--exclude='/tmp' \
--exclude='/usr' \
--exclude='/home' \
--exclude='/root/logs' \
 $SRCDIR $TGTDIR/$WEEKDAY

/bin/chmod 700 $TGTDIR
/bin/chmod 700 $TGTDIR/$WEEKDAY
/bin/date
