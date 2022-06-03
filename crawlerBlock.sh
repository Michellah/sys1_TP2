#!/bin/bash

awk '($9 !~ /404/)' /var/log/apache2/access.log | awk '{print $9,$7}' | sort | uniq | sed -n '/404$/p' | tail -f | iptables -A INPUT -s $1 -j DROP
