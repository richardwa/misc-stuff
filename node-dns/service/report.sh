#!/bin/bash

# requests per device
# journalctl -u node-dns --no-pager --since "1 day ago" | awk '{if ($7 ~ "192.168") a[$7]++;}END{for(i in a)printf "%-15s %d\n", i,a[i]}'


# per device details
# journalctl -u node-dns --no-pager --since "1 day ago" | 
#   awk '{ if ($7 ~ "192.168") {n=split($8,b,"."); a[$7" "$6" "b[n-1]"."b[n]]++;}}END{for(i in a) print i,a[i]}' |
#   awk '{ printf "%-15s %05d %s %s\n", $1, $4, $2, $3 }' | 
#   sort 

journalctl -u node-dns --no-pager --since "1 day ago" -o short-iso |
awk 'NR==1 {print "req allow client site domain"}; NR!= 1 {n=split($6,b,"."); print substr($1,1,19),$4,$5,$6,b[n-1]"."b[n]}' |
textql --header --output-header -dlm " " -sql " 
select strftime('%Y-%m-%d %H',req) as _date, count(1) as count
group by _date
" | awk -F, 'NR != 1 { n=int(50 * $2/5000); printf("%s %5d ",$1,$2); while (n--) printf("*"); print("") }'