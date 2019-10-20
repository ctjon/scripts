#
# Script to setup wlan for private/WEP access
#
modprobe ipw2200
ifconfig eth1 down
iwlist eth1 scan
iwconfig eth1 mode Managed
iwconfig eth1 key 34AFED34590874D129AFED45EA
iwconfig eth1 essid Sagarmatha
ifconfig eth1 up
dhclient eth1
