# THIS IS BROKEN!  WORK IN PROGRESS
for i in `find /home/chris/MyDocuments/Photos.old -type f -print|sed 's/.*\///'`
do
	echo $i
done
