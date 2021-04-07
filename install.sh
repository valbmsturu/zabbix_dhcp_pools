#!/bin/sh

apt install dhcpd-pools

apt install xmlstarlet

cp dhcp-pools-discovery.sh /etc/zabbix/

cp dhcp-pools-shared-network.sh /etc/zabbix/

echo 'UserParameter=dhcp.pools.discovery,/etc/zabbix/dhcp-pools-discovery.sh' > /etc/zabbix/zabbix_agentd*.d/dhcp_stat.conf

echo 'UserParameter=dhcp.pools.shared-network[*],/etc/zabbix/dhcp-pools-shared-network.sh $1 $2' >> /etc/zabbix/zabbix_agentd*.d/dhcp_stat.conf 

service zabbix-agent restart

