#!/bin/bash

echo -n '{"data":['

str=`/usr/bin/dhcpd-pools -c /etc/dhcp/dhcpd.conf -f x | \
/usr/bin/xmlstarlet sel -T -t -m '//shared-network' \
-o '{"{#POOLNAME}":"' -v location -o '"},'`

echo -n ${str::-1}

echo -n ']}'

