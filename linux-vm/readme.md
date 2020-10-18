# dependencies


enable virtual system
# systemctl enable --now libvirtd

create a hard drive, best to put on ext4 partition
# sudo qemu-img create -f qcow2 win10-disk-32G 32G

create vm using win10.xml
# virsh create win10.xml