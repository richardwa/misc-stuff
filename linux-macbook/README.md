tested working on Ubuntu 20.04 LTS

# Install default Ubuntu
install ubuntu without third party drivers first
after rebooting find MCP89 bridge and display
> sudo lshw -businfo -class bridge -class display

# update grub, add file
> vi /etc/grub.d/01_enable_vga.conf 
```
cat << EOF
setpci -s "00:17.0" 3e.b=8
setpci -s "04:00.0" 04.b=7
EOF
```
> sudo chmod 755 /etc/grub.d/01_enable_vga.conf
> sudo update-grub


# install nvidia drivers
lan cable required
> sudo ubuntu-drivers autoinstall


# fix brightness control
edit /usr/share/X11/xorg.conf.d/nvida-drm-outputclass-ubuntu.conf, and add:
Option "RegistryDwords" "EnableBrightnessControl=1"

restart X
sudo systemctl restart display-manager

# references
https://askubuntu.com/questions/264247/proprietary-nvidia-drivers-with-efi-on-mac-to-prevent-overheating/613573#613573
nvidi://askubuntu.com/questions/76081/brightness-not-working-after-installing-nvidia-driver
