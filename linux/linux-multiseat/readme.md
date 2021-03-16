# use loginctl to assign seat2 devices
1. list current seat0 devices
loginctl --no-pager seat-status seat0

2. Assign appropriate devices

loginctl attach seat1 /sys/devices/pci0000:00/0000:00:02.0/drm/card0
loginctl attach seat1 /sys/devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10
loginctl attach seat1 /sys/devices/pci0000:00/0000:00:14.0/usb1/1-9/1-9
loginctl attach seat1 /sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8
loginctl attach seat1 /sys/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7

3. backup auto generated udev rules
cp /etc/udev/rules.d/72* 