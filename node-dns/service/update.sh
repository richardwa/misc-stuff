#!/bin/bash
cd /home/public/node-dns
rm -rf ./node-dns
cp -r /home/rich/github/misc-stuff/node-dns/ .
echo  cp ./node-dns/service/node-dns.service /etc/systemd/system/node-dns.service
sudo chown -R public:public ./node-dns
