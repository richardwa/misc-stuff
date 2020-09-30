## flash engery monitoring plug with tasmota using tuya conver

### setup raspberry pi zero w
* we need to ssh into the pi via usb, that way when we perform the flash with wifi chip, our ssh session will stay connection
  1. echo dtoverlay=dwc2 >> config.txt
  2. echo -e " modules-load=dwc2,g_ether" >> config.txt
    * ensure the extra text comes after rootwait with a space separating it
  3. pi will not show up as ethernet device to the host computer
    * ssh pi@raspberrypi.local
    * note pi will not have internet connection without further setup on host (not required)


### tuya-convert
1.  in the pi, do:
git clone https://github.com/ct-Open-Source/tuya-convert
cd tuya-convert
sudo ./start_flash.sh
  * hold button on plug to enter flash mode
  * connect to virt-flash access point created by the pi with a phone
  * resume flashing, enter: yes
tasmota is now flashed, tasmota will show up as another access point
2. connect to tasmota AP on phone
3. configure home network wifi (SSID,PW) via phone browser
4. on any local network browser, navigate to the plug (check router page for new client/IP)
5. update tasmota firmware
6. configure plug using template:
  {"NAME":"BNC-60/U133TJ","GPIO":[0,56,0,17,134,132,0,0,131,57,21,0,0],"FLAG":0,"BASE":18}
7. in webconsole: PowerOnState 4 
  * this will set the plug to be always on (that way even if we reboot the devices will keep power)
