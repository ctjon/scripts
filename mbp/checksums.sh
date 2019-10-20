for DISC in Fedora-*.iso
do 
	echo -n "$DISC "
	RELEASE=`echo $DISC|awk -F - {'print $2'}`
	export ARCH=`echo $DISC|awk -F - {'print $3'}`
	SUM1=`grep $DISC Fedora-$RELEASE-$ARCH-CHECKSUM|awk {'print $1'}`
	SUM2=`sha256sum $DISC|awk {'print $1'}`
	
	if [[ "$SUM1" == "$SUM2" ]]
	then
		echo "OK"
	else
		echo "FAILED"
	fi
	echo sum1=$SUM1
	echo sum2=$SUM2
	echo " "
done
