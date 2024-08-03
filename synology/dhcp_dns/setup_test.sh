#!/bin/bash
nsupdate -k dns_key.txt test_batch.txt
echo "172.16.1.99 test" >> dhcpd.conf.leases.prev
