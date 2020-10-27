# setup QMK python tool
[QMK CLI](https://beta.docs.qmk.fm)
python3 -m pip install qmk
qmk setup
# expect setup to install into ~/qmk_firmware

# disable modemmanager
sudo systemctl stop ModemManager.service
sudo systemctl disable ModemManager.service

# additional udev rule for jj40
ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="05df", MODE="0666", GROUP="plugdev"

# note: to flash unplug keyboard, hold backspace, then plugin keyboard
./deploy.sh

