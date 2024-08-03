#!/bin/bash
################################################################################
# Script to do dynamic DNS update on synology DSM without manually modifying   #
# config files that could be overwritten later.  This script relies on the use #
# of nsupdate to add and remove dns A and PTR records as necessary.            #
#                                                                              #
# Step 1: Compare current DHCP Leases file to Previous DHCP Leases from last   #
#         run.  This will tell us what to delete by determining what was in    #
#         the previous file that is not there now.  Add these commands to the  #
#         command batch file to be run at the end.  Do this for both A and PTR #
#         records.                                                             #
################################################################################
export TTL=600 # Can't figure out how to subsitute this in awk expression yet
export SCRIPT_DIR=/volume1/homes/chris/scripts/dhcp_dns
export KEY_FILE=$SCRIPT_DIR/dns_key.txt
export ADD_A_RECORDS_TMP_FILE=$SCRIPT_DIR/dns_batch_add_a_records.tmp
export DEL_A_RECORDS_TMP_FILE=$SCRIPT_DIR/dns_batch_del_a_records.tmp
export ADD_PTR_RECORDS_TMP_FILE=$SCRIPT_DIR/dns_batch_add_ptr_records.tmp
export DEL_PTR_RECORDS_TMP_FILE=$SCRIPT_DIR/dns_batch_del_ptr_records.tmp
export BATCH_FILE=$SCRIPT_DIR/dns_batch_update.txt
export DHCP_LEASES=/etc/dhcpd/dhcpd.conf.leases
export DHCP_LEASES_COPY=$SCRIPT_DIR/dhcpd.conf.leases.copy
export DHCP_LEASES_PREV=$SCRIPT_DIR/dhcpd.conf.leases.prev
export DHCP_LEASES_DIFF=$SCRIPT_DIR/dhcpd.conf.leases.diff

################################################################################
# If no previous leases file exists, copy, first run will do no deletes        #
################################################################################
cat $DHCP_LEASES |cut -d " " -f 3-4|grep -v "*" > $DHCP_LEASES_COPY
if [ ! -f $DHCP_LEASES_PREV ]; 
then
	echo "no previous dhcp leases file, copying"
	cp $DHCP_LEASES_COPY $DHCP_LEASES_PREV
fi
diff $DHCP_LEASES_COPY $DHCP_LEASES_PREV |grep ">"|cut -d " " -f 2- > $DHCP_LEASES_DIFF

echo "server 127.0.0.1" > $BATCH_FILE
################################################################################
# Delete A/forward records                                                     #
################################################################################
cat $DHCP_LEASES_DIFF| awk -F " " '{print $2".internal.tjon.net"}'|grep -v "*" > $DEL_A_RECORDS_TMP_FILE

cat $DEL_A_RECORDS_TMP_FILE|awk -F " " '{print "update delete "$1".  A"}' >>$BATCH_FILE
echo "send" >> $BATCH_FILE

################################################################################
# Delete PTR/reverse records                                                   #
################################################################################
cat $DHCP_LEASES_DIFF| cut -d " " -f 1 |awk -F "." '{print $4".1.16.172.in-addr.arpa"}' > $DEL_PTR_RECORDS_TMP_FILE

cat $DEL_PTR_RECORDS_TMP_FILE|awk -F " " '{print "update delete "$1". PTR "}' >>$BATCH_FILE
echo "send" >> $BATCH_FILE

################################################################################
# Add the A/forward records                                                    #
################################################################################
cat $DHCP_LEASES| awk -F " " '{print $4".internal.tjon.net " $3}'|grep -v "*" > $ADD_A_RECORDS_TMP_FILE

cat $ADD_A_RECORDS_TMP_FILE|awk -F " " '{print "update add "$1" 600 A "$2}' >>$BATCH_FILE
echo "send" >> $BATCH_FILE

################################################################################
# Add the PTR/reverse records                                                  #
################################################################################
cat $DHCP_LEASES| awk -F " " '{print $3".1.16.172.in-addr.arpa "$4".internal.tjon.net."}'|cut -d "." -f 4- |grep -v "*" > $ADD_PTR_RECORDS_TMP_FILE

cat $ADD_PTR_RECORDS_TMP_FILE|awk -F " " '{print "update add "$1" 600 PTR "$2}' >>$BATCH_FILE

echo "send" >> $BATCH_FILE
echo "quit" >> $BATCH_FILE

################################################################################
# Review the created batch file                                                #
################################################################################
cat $BATCH_FILE

################################################################################
# Run the update                                                               #
################################################################################
nsupdate -k $KEY_FILE $BATCH_FILE

################################################################################
# Clean up the temp files                                                      #
################################################################################
rm $ADD_A_RECORDS_TMP_FILE
rm $DEL_A_RECORDS_TMP_FILE
rm $ADD_PTR_RECORDS_TMP_FILE
rm $DEL_PTR_RECORDS_TMP_FILE
rm $DHCP_LEASES_DIFF
cp $DHCP_LEASES_COPY $DHCP_LEASES_PREV
