# dependencies
sudo apt install qemu-kvm libvirt-bin bridge-utils virt-manager qemu virt-viewer spice-vdagent

enable virtual system
# systemctl enable --now libvirtd

create a hard drive, best to put on ext4 partition
# cd /mnt/sata/vm-images
# sudo qemu-img create -f raw win10-disk-32G 32G

create vm using win10.xml
# sudo virsh create win10.xml

set bios primary display to internal display

# set nvidia to MSI mode - using registry
# https://www.underealm.com/tech/2019/05/nvidia-drivers-and-msi-support-in-windows/
PS C:\Users\rwang> reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_10F1&SUBSYS_8C951462&REV_A1\4&1743037d&0&0015\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_10F1&SUBSYS_8C951462&REV_A1\4&1743037d&0&0015\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties
    MSISupported    REG_DWORD    0x1

# get xml
virsh dumpxml win10 > win10.xml