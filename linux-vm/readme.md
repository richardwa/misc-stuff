# dependencies
sudo apt install qemu-kvm libvirt-bin bridge-utils virt-manager qemu virt-viewer spice-vdagent

enable virtual system
# systemctl enable --now libvirtd

create a hard drive, best to put on ext4 partition
# cd /mnt/sata/vm-images
# sudo qemu-img create -f raw win10-disk-32G 32G

create vm using win10.xml
# sudo virsh create win10.xml