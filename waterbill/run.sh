#!/bin/bash
. ~/home/Documents/git-local/bwsc-login.profile

curl -v -c out/cookiejar.tmp "https://old.bwsc.org/ACCOUNTS/security_main.asp?AcctNum=${BWSC_ACCT}&MtrNum=${BWSC_CODE}"
curl -v -b out/cookiejar.tmp "https://old.bwsc.org/ACCOUNTS/trans_history.asp" > out/html.tmp

cat out/html.tmp \
| tr -d "\n\r" `# make into single line`\
| tr -s " "    `# merge multiple spaces`\
| grep -Po "<tr>.*?</tr>"  `# get the tr's`\
| tail -n +3 `# remove top 3 lines`\
| tr -d "<tdr/>$" `# remove unwanted chars` \
| tr -s " " `# merge multiple spaces (again)`\
| awk '{ print substr($1,5,4)"/"substr($1,1,2)"/"substr($1,3,2), $2, $3 + $4 }' `# date, consumption, cost`\
| sort -n `# sort number` \
> out/formatted.txt

echo "date consumption cost" | cat - out/formatted.txt
