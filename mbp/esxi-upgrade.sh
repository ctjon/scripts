# Cut and paste these commands into an ESXi shell to update your host with this Imageprofile
# See the Help page for more instructions
#
esxcli network firewall ruleset set -e true -r httpClient
esxcli software profile update -p ESXi-6.5.0-20170702001-standard \
-d https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml
esxcli network firewall ruleset set -e false -r httpClient
#
# Reboot to complete the upgrade
