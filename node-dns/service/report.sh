#!/bin/bash

# get console size
cols=$(stty size|cut -d' ' -f2)
cols=$(expr $cols - 36)

# devices table
printf "mac name ip\n" > /dev/shm/devices.txt
cat /home/rich/github/personal/ddwrt/devices.md | grep "192.168" | tr -s "|" " " >> /dev/shm/devices.txt

# dns logs table
journalctl -u node-dns --no-pager --since "1 day ago" -o short-iso |
awk 'NR==1 {print "req allow client site domain"}; NR!= 1 {n=split($6,b,"."); print substr($1,1,19),$4,$5,$6,b[n-1]"."b[n]}' > /dev/shm/dns.txt

# requests per device
printf "\n\nCLIENT REQUESTS\n"

textql --header --output-header -dlm " " -sql " 
select b.name, count(1) as count
from dns a
join devices b on a.client = b.ip  
group by name
order by count
" /dev/shm/dns.txt /dev/shm/devices.txt > /dev/shm/tmp.txt
max=$(cut -d"," -f2 /dev/shm/tmp.txt | sort -nr | head -1)
awk -F, 'NR != 1 { n=int('$cols' * $2/'$max'); printf("%-20.20s %5d ",$1,$2); while (n--) printf("*"); print("") }' /dev/shm/tmp.txt

printf "\n\nTOP 50 DOMAIN REQUESTS\n"
textql --header --output-header -dlm " " -sql " 
select domain, count(1) as count
from dns
group by domain
order by count desc
limit 50
" /dev/shm/dns.txt > /dev/shm/tmp.txt
max=$(cut -d"," -f2 /dev/shm/tmp.txt | sort -nr | head -1)
awk -F, 'NR != 1 { n=int('$cols' * $2/'$max'); printf("%-20.20s %5d ",$1,$2); while (n--) printf("*"); print("") }' /dev/shm/tmp.txt

printf "\n\nACTIVITY BY HOUR\n"
textql --header --output-header -dlm " " -sql " 
select strftime('%Y-%m-%d %H',req) as _date, count(1) as count
from dns
group by _date
" /dev/shm/dns.txt > /dev/shm/tmp.txt
max=$(cut -d"," -f2 /dev/shm/tmp.txt | sort -nr | head -1)
awk -F, 'NR != 1 { n=int('$cols' * $2/'$max'); printf("%-20.20s %5d ",$1,$2); while (n--) printf("*"); print("") }' /dev/shm/tmp.txt

rm /dev/shm/devices.txt /dev/shm/dns.txt /dev/shm/tmp.txt