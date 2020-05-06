#!/bin/sh

res_field=2
test "x$2" = "xused" && res_field=3

/usr/bin/dhcpd-pools -c /etc/dhcp/dhcpd.conf -f x | \
  /usr/bin/xmlstarlet sel -T -t -m '//shared-network' \
  -v location -o ' ' -v defined -o ' ' -v used -n | \
  grep $1 | cut -d ' ' -f $res_field

