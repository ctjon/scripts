cat instructor_inventory.txt |awk -F ' ' '{print $2}'|cut -c14-|grep -v -e '^$'>iplist.txt
