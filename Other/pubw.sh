#
# Script to setup wlan for public/Non WEP access
#
modprobe ipw2200
ifconfig eth1 down
iwlist eth1 scan
iwconfig eth1 mode Managed
iwconfig eth1 key off
iwconfig eth1 essid any
ifconfig eth1 up
dhclient eth1
