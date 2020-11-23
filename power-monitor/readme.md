## flash engery monitoring plug with tasmota using tuya convert.  see tuya-setup.md
## setup mqtt logging power usage


### mqtt server
on local netowrk server install mosquitto

> sudo apt install mosquitto
> sudo apt install mosquitto-clients

* show all incoming messages
mosquitto_sub -v -t "#"

* start logging on startup
* ensure write permission to target file
echo "@reboot developer /usr/bin/mosquitto_sub -v -t '#' >> /home/developer/misc-stuff/power-monitor/logs/power.log" | sudo tee -a /etc/crontab

* start logging now
nohup mosquitto_sub -v -t "#" >> /home/developer/misc-stuff/power-monitor/logs/power.log &

* on ubuntu mosquito will now start automatically
* nothing to config anonymous access on local network is fine

### ntpserver
* router is configured to never let IOT devices talk to internet
on local network server install ntp
> sudo apt install ntp

