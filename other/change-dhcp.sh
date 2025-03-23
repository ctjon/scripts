sudo virsh net-dumpxml default
sudo virsh net-update default delete ip-dhcp-range "<range start='192.168.122.2' end='192.168.122.254'/>" --live --config

sudo virsh net-update default add ip-dhcp-range "<range start='192.168.122.100' end='192.168.122.254'/>" --live --config
sudo virsh net-dumpxml default

sudo systemctl restart libvirtd
