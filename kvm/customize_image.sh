sudo virt-customize -a /var/lib/libvirt/images/testvm-rhel8.qcow2 \

--root-password password:pass1234 \
--hostname=testvm-rhel8 \
--uninstall cloud-init
