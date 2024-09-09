
rpm-ostree upgrade

# fix podman error if problem with distrobox

mkdir .local/share/containers/storage/volumes


# setup a box for megasync
distrobox-create --name uduntu_box --image ububtu:latest
distrobox-enter ubuntu_box
wget https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megasync-xUbuntu_24.04_amd64.deb && sudo apt install "$PWD/megasync-xUbuntu_24.04_amd64.deb"
distrobox-export --app megasync
sudo apt install grsync
distrobox-export --app grsync
exit

# set up virt manager user
sudo su
grep -E '^libvirt:' /usr/lib/group >> /etc/group
usermod -a -G libvirt kevin
exit

# turn of auto updates
sudo nano /etc/rpm-ostreed.conf  stage to none

# set up nordvpn
sudo systemctl enable --now nordvpnd.service

sudo su
grep -E '^nordvpn:' /usr/lib/group >> /etc/group
usermod -a -G nordvpn kevin
exit

nordvpn allowlist add subnet 192.168.0.0/16
or 
nordvpn set lan-discovery on

nordvpn login --token


# optional if permission virt-manager  issue when first trying to create

#sudo restorecon -rv /var/lib/libvirt
#sudo restorecon -rv /var/log/libvirt

#add kernal args
#rpm-ostree kargs --editor
#add next line to end
#  i8042.reset i8042.nomux i8042.nopnp i8042.noloop






