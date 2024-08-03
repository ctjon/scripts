export A_RECORDS_TMP_FILE=dns_batch_a_records.tmp
export PTR_RECORDS_TMP_FILE=dns_batch_ptr_records.tmp
export BATCH_FILE=dns_batch_update.txt

# do the A/forward records
echo "server 127.0.0.1" > $BATCH_FILE
cat /etc/dhcpd/dhcpd.conf.leases| awk -F " " '{print $4".internal.tjon.net."}'|grep -v "*" > $A_RECORDS_TMP_FILE

cat $A_RECORDS_TMP_FILE|awk -F " " '{print "update delete "$1" A"}' >>$BATCH_FILE
echo "send" >> $BATCH_FILE

# do the PTR/reverse records
cat /etc/dhcpd/dhcpd.conf.leases| awk -F " " '{print $3".1.16.172.in-addr.arpa."}'|cut -d "." -f 4- |grep -v "*" > $PTR_RECORDS_TMP_FILE

cat $PTR_RECORDS_TMP_FILE|awk -F " " '{print "update delete "$1}' >>$BATCH_FILE

echo "send" >> $BATCH_FILE
echo "quit" >> $BATCH_FILE

cat $BATCH_FILE

nsupdate -k dns_key.txt $BATCH_FILE

rm $A_RECORDS_TMP_FILE
rm $PTR_RECORDS_TMP_FILE
