#!/bin/bash

# requests per device
journalctl -u node-dns --no-pager | awk '{if ($7 ~ "192.168") a[$7]++;}END{for(i in a)printf "%-15s %d\n", i,a[i]}'


# per device details
journalctl -u node-dns --no-pager | 
  awk '{if ($7 ~ "192.168") a[$7" "$6" "$8]++;}END{for(i in a) print i,a[i]}' |
  awk '{ printf "%-15s %05d %s %s\n", $1, $4, $2, $3 }' | 
  sort 