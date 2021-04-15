## flash engery monitoring plug with tasmota using tuya convert.  see tuya-setup.md
## setup mqtt logging power usage

___
### mqtt server
on local netowrk server install mosquitto
mosquitto will start automatically since it is a service
```
sudo apt install mosquitto
```

### mqtt logging
* manually setup mosquitto_sub to log into journalctl -- see powermonitor-service
* 
```
sudo apt install mosquitto-clients
```

___
### ntpserver
* router is configured to never let IOT devices talk to internet
* on local network server install ntp
```
sudo apt install ntp
```
