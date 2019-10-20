external_int="eth1"
external_ip="`ifconfig $external_int | grep 'inet addr' | \

                       awk '{print $2}' | sed -e 's/.*://'`"
echo "external_ip = $external_ip"
