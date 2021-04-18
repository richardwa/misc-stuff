#!/bin/bash

# requests per device
printf "\n\nCLIENT REQUESTS\n"
journalctl -u node-dns --no-pager --since "1 day ago" -o short-iso |
awk 'NR==1 {print "req allow client site domain"}; NR!= 1 {n=split($6,b,"."); print substr($1,1,19),$4,$5,$6,b[n-1]"."b[n]}' |
textql --header --output-header -dlm " " -sql " 
select client, count(1) as count
group by client
order by count
" | awk -F, 'NR != 1 { n=int(50 * $2/5000); printf("%-20.20s %5d ",$1,$2); while (n--) printf("*"); print("") }'

printf "\n\nTOP 50 DOMAIN REQUESTS\n"
journalctl -u node-dns --no-pager --since "1 day ago" -o short-iso |
awk 'NR==1 {print "req allow client site domain"}; NR!= 1 {n=split($6,b,"."); print substr($1,1,19),$4,$5,$6,b[n-1]"."b[n]}' |
textql --header --output-header -dlm " " -sql " 
select domain, count(1) as count
group by domain
order by count desc
limit 50
" | awk -F, 'NR != 1 { n=int(50 * $2/5000); printf("%-20.20s %5d ",$1,$2); while (n--) printf("*"); print("") }'

printf "\n\nACTIVITY BY HOUR\n"
journalctl -u node-dns --no-pager --since "1 day ago" -o short-iso |
awk 'NR==1 {print "req allow client site domain"}; NR!= 1 {n=split($6,b,"."); print substr($1,1,19),$4,$5,$6,b[n-1]"."b[n]}' |
textql --header --output-header -dlm " " -sql " 
select strftime('%Y-%m-%d %H',req) as _date, count(1) as count
group by _date
" | awk -F, 'NR != 1 { n=int(50 * $2/5000); printf("%-20.20s %5d ",$1,$2); while (n--) printf("*"); print("") }'
