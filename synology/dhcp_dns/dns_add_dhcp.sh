#!/bin/bash
export TTL=600 # Can't figure out how to subsitute this in awk expression yet
export A_RECORDS_TMP_FILE=dns_batch_a_records.tmp
export PTR_RECORDS_TMP_FILE=dns_batch_ptr_records.tmp
export BATCH_FILE=dns_batch_update.txt
export DHCP_LEASES=/etc/dhcpd/dhcpd.conf.leases

################################################################################
# Add the A/forward records                                                    #
################################################################################
echo "server 127.0.0.1" > $BATCH_FILE
cat $DHCP_LEASES| awk -F " " '{print $4".internal.tjon.net " $3}'|grep -v "*" > $A_RECORDS_TMP_FILE

cat $A_RECORDS_TMP_FILE|awk -F " " '{print "update add "$1" 600 A "$2}' >>$BATCH_FILE
echo "send" >> $BATCH_FILE

################################################################################
# Add the PTR/reverse records                                                  #
################################################################################
cat $DHCP_LEASES| awk -F " " '{print $3".1.16.172.in-addr.arpa "$4".internal.tjon.net."}'|cut -d "." -f 4- |grep -v "*" > $PTR_RECORDS_TMP_FILE

cat $PTR_RECORDS_TMP_FILE|awk -F " " '{print "update add "$1" 600 PTR "$2}' >>$BATCH_FILE

echo "send" >> $BATCH_FILE
echo "quit" >> $BATCH_FILE

################################################################################
# Review the created batch file                                                #
################################################################################
cat $BATCH_FILE

################################################################################
# Run the update                                                               #
################################################################################
#nsupdate -k dns_key.txt $BATCH_FILE

################################################################################
# Clean up the temp files                                                      #
################################################################################
rm $A_RECORDS_TMP_FILE
rm $PTR_RECORDS_TMP_FILE
#rm $DHCP_LEASES_DIFF
