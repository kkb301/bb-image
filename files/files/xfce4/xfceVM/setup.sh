
rpm-ostree upgrade

# fix podman error if problem with distrobox

mkdir .local/share/containers/storage/volumes


# setup a box for megasync
distrobox-create --name fedora40_box --image fedora:40
distrobox-enter fedora40_box
sudo dnf install wget
wget https://mega.nz/linux/repo/Fedora_40/x86_64/megasync-Fedora_40.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_40.x86_64.rpm"
distrobox-export --app megasync

# set up virt manager user
sudo su
grep -E '^libvirt:' /usr/lib/group >> /etc/group
usermod -a -G libvirt kevin
exit

# turn of auto updates
sudo nano /etc/rpm-ostreed.conf  stage to none


# optional if permission issue when first trying to create

#sudo restorecon -rv /var/lib/libvirt
#sudo restorecon -rv /var/log/libvirt

#add kernal args
#rpm-ostree kargs --editor
#add next line to end
#  i8042.reset i8042.nomux i8042.nopnp i8042.noloop

#  dconf load / < gnome-desktop




