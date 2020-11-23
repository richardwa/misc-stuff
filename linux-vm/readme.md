# dependencies
sudo apt install qemu-kvm bridge-utils virt-manager qemu virt-viewer spice-vdagent

# enable virtual system
systemctl enable --now libvirtd


# find hardware ids for grub edit
lspci -nn

# these are all getting passed to vm
1b21:2142 - Asmedia USB 3.1 controller
10de:1c02 - NVIDIA GTX 1060
10de:10f1 - NVIDIA Audio (via hdmi/dp)
10de:1c02 - Intel SATA controller

# edit grub
sudo vi /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="intel_iommu=on vfio-pci.ids=10de:1c02,10de:10f1"


create vm using win10.xml
# sudo virsh create win10.xml

set bios primary display to internal display

# set nvidia to MSI mode 
## show setting on 
sudo lspci -vs 01:00.0 | grep 'MSI:'

# on Windows - using registry
# https://www.underealm.com/tech/2019/05/nvidia-drivers-and-msi-support-in-windows/
PS C:\Users\rwang> reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_10F1&SUBSYS_8C951462&REV_A1\4&1743037d&0&0015\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_10F1&SUBSYS_8C951462&REV_A1\4&1743037d&0&0015\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties
    MSISupported    REG_DWORD    0x1

Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_1C02&SUBSYS_8C951462&REV_A1\4&48952d8&0&0014\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties
    MSISupported    REG_DWORD    0x1

# get xml
virsh dumpxml win10 > xml/win10.xml
