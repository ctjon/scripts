for i in `ls -1 /Volumes/CentOS_5.5_Final/CentOS/`
do
	if [ -f /Volumes/CentOS_5.5_Final/CentOS/$i ] && [ -f /Volumes/CentOS-5.5-x86_64/CentOS/$i ]
	then
		echo "$i OK"
	else
		echo "$i Missing"
	fi
done
