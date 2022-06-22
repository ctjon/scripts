if [ $# != 3 ]
then
	echo "usage: mkiso.sh target.iso iso_name srcdir"
	exit 1
else
	echo "making iso $1 with title $2 and src $3"
	mkisofs -l -r -J -m TRANS.TBL -o $1 -V "$2" -hide-joliet-trans-tbl -hide-rr-moved -allow-leading-dots $3
fi
