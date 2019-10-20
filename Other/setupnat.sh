#!/bin/ksh
set -x
export intnic=eth0
export intsubnet=10.51.50.0/24
export extnic=eth1
export extip="`ifconfig $extnic | grep 'inet addr' | awk '{print $2}' | sed -e 's/.*://'`"
echo "extip = $extip"

#
# flush the current iptables configuration
#
iptables -F

#
# Drop all packets destined for invalid sources on external interface
#
iptables -A INPUT -s 10.0.0.0/8 -j DROP
iptables -A INPUT -s 172.16.0.0/12 -j DROP
iptables -A INPUT -s 192.168.0.0/16 -j DROP
iptables -A INPUT -s 224.0.0.0/4 -j DROP
iptables -A INPUT -s 240.0.0.0/5 -j DROP
iptables -A INPUT -s 127.0.0.0/8 -j DROP
iptables -A INPUT -s 0.0.0.0/8 -j DROP
iptables -A INPUT -d 255.255.255.255 -j DROP
iptables -A INPUT -s 169.254.0.0/16 -j DROP
iptables -A INPUT -s $extip -j DROP
iptables -A OUTPUT -d 224.0.0.0/4 -j DROP

#
# Allow firewall to access the internet
#
iptables -A OUTPUT -j ACCEPT -m state --state NEW,ESTABLISHED,RELATED -o $extnic
iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED -i $extnic

#
# Allow bi-directional traffic between the firewall and the protected network, bridged network, and virtual networks
#
iptables -A INPUT -j ACCEPT -p all -s $intsubnet -i $intnic
iptables -A OUTPUT -j ACCEPT -p all -d $intsubnet -o $intnic
iptables -A INPUT -j ACCEPT -p all -s $intsubnet -i vmnet1
iptables -A OUTPUT -j ACCEPT -p all -d $intsubnet -o vmnet1
iptables -A INPUT -j ACCEPT -p all -s $intsubnet -i vmnet8
iptables -A OUTPUT -j ACCEPT -p all -d $intsubnet -o vmnet8
iptables -A INPUT -i $intnic -p udp -m udp -s $intsubnet --dport 137 -j ACCEPT
iptables -A INPUT -i $intnic -p udp -m udp -s $intsubnet --dport 32700:32800 -j ACCEPT
iptables -A INPUT -i $intnic -p tcp -m tcp -s $intsubnet --dport 139 -j ACCEPT
iptables -A INPUT -i $intnic -p tcp -m tcp -s $intsubnet --dport 445 -j ACCEPT
iptables -A INPUT -i $intnic -p tcp -m tcp -s $intsubnet --dport 32800:32900 -j ACCEPT


#
# load the NAT module
#
modprobe iptable_nat

#
# enable routing
#
echo 1 > /proc/sys/net/ipv4/ip_forward

#
# setup masquerading
#
/sbin/iptables -t nat -A POSTROUTING -o $extnic -j MASQUERADE
/sbin/iptables -A FORWARD -i $extnic -o $intnic -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i $intnic -o $extnic -j ACCEPT

#
# allow ssh access
#
/sbin/iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT

#
# allow openvpn access
#
/sbin/iptables -A FORWARD -i br0 -j ACCEPT
/sbin/iptables -A FORWARD -i tap0 -j ACCEPT
/sbin/iptables -A INPUT -i br0 -j ACCEPT
/sbin/iptables -A INPUT -i tap0 -j ACCEPT
/sbin/iptables -A INPUT -i $extnic -p udp -m state --state NEW -m udp --dport 1194 -j ACCEPT
/sbin/iptables -A INPUT -i $extnic -p udp -m state --state NEW -m udp --dport 5000 -j ACCEPT

#
# log and drop all other packets to /var/log/messages
#
iptables -A OUTPUT -j LOG
iptables -A INPUT -j LOG
iptables -A FORWARD -j LOG
iptables -A OUTPUT -j DROP
iptables -A INPUT -j DROP
iptables -A FORWARD -j DROP
