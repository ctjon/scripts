yum -y install dhcp
yum -y update
mount /dev/sb1 /mnt
/bin/cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.dist
chcon system_u:object_r:dhcp_etc_t:s0 /etc/dhcp/dhcpd.conf
/bin/cp -f /mnt/ConfigFiles/etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf
chkconfig --levels 2345 dhcpd on
/bin/cp -f /mnt/ConfigFiles/etc/rndc.key /etc/rndc.key
restorecon /etc/rndc.key
service dhcpd start
firewall-cmd --zone=public --list-all
firewall-cmd --zone=public --remove-interface=enp1s0
firewall-cmd --zone=public --remove-interface=enp1s0 --permanent
firewall-cmd --zone=public --remove-interface=enp2s0
firewall-cmd --zone=public --remove-interface=enp2s0 --permanent

firewall-cmd --zone=external --add-interface=enp1s0
firewall-cmd --zone=external --add-interface=enp1s0 --permanent
firewall-cmd --zone=internal --add-interface=enp2s0
firewall-cmd --zone=internal --add-interface=enp2s0 --permanent

firewall-cmd --zone=external --query-masquerade
firewall-cmd --zone=internal --query-masquerade

firewall-cmd --zone=external --add-icmp-block=echo-request
firewall-cmd --zone=external --add-icmp-block=echo-request --permanent

/bin/cp -f /etc/ssh/sshd_config /etc/ssh/sshd_config.dist
chcon system_u:object_r:etc_t:s0 /etc/ssh/sshd_config.dist
/bin/cp -f /mnt/ConfigFiles/etc/ssh/sshd_config /etc/ssh/sshd_config
service sshd restart

rpm -e kernel-3.10.0-123.el7.x86_64

shutdown -r now

