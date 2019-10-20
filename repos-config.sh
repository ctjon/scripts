#!/bin/bash

if [ "$#" -ne 1 ] 
then
	echo "$0: Needs one argument">&2
	echo "Usage: $0 server0|public|p51s(on p51s only)">&2
	exit 1
fi

case $1 in
server0)
	echo "switching to update from server0 repos"
        sudo dnf config-manager --set-disabled fedora --save
        sudo dnf config-manager --set-disabled updates --save
        sudo dnf config-manager --set-enabled fedora-server0 --save
        sudo dnf config-manager --set-enabled updates-server0 --save
        sudo dnf config-manager --set-disabled virtio-win-stable-server0 --save
        sudo dnf config-manager --set-disabled virtio-win-source-server0 --save
        if [ `hostname -s` == "p51s" ]
        then
       		sudo dnf config-manager --set-disabled fedora-p51s --save
       		sudo dnf config-manager --set-disabled updates-p51s --save
        	sudo dnf config-manager --set-disabled virtio-win-stable-x1carbon --save
        	sudo dnf config-manager --set-disabled virtio-win-source-x1carbon --save
        fi
;;
p51s)
        if [ `hostname -s` == "p51s" ]
        then
		echo "switching to update from p51s repos"
        	sudo dnf config-manager --set-disabled fedora --save
        	sudo dnf config-manager --set-disabled updates --save
        	sudo dnf config-manager --set-disabled fedora-server0 --save
        	sudo dnf config-manager --set-disabled updates-server0 --save
        	sudo dnf config-manager --set-enabled fedora-p51s --save
        	sudo dnf config-manager --set-enabled updates-p51s --save
	else
		echo "option only available on p51s host"
	fi
;;
public)
	echo "switching to update from public repos"
        sudo dnf config-manager --set-enabled fedora --save
        sudo dnf config-manager --set-enabled updates --save
        sudo dnf config-manager --set-disabled virtio-win-stable --save
        sudo dnf config-manager --set-disabled virtio-win-source --save
        sudo dnf config-manager --set-disabled fedora-server0 --save
        sudo dnf config-manager --set-disabled virtio-win-stable-x1carbon --save
        sudo dnf config-manager --set-disabled virtio-win-source-x1carbon --save
        sudo dnf config-manager --set-disabled updates-server0 --save
        if [ `hostname -s` == "p51s" ]
        then
       		sudo dnf config-manager --set-disabled fedora-p51s --save
       		sudo dnf config-manager --set-disabled updates-p51s --save
        fi
;;
*)
	echo "Usage: $0 server0|public">&2
	exit 1
;;
esac
