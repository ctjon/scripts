#!/bin/bash
set -x

curl -o /var/squidGuard/shallalist.tar.gz http://www.shallalist.de/Downloads/shallalist.tar.gz

cd /var/squidGuard/

tar -xzf /tmp/shallalist.tar.gz

squidGuard -C all

chown -R squid:squid /var/squidGuard/

restorecon -RFv /var/squidGuard


