
# set up flatpak environment

flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-delete fedora

flatpak install -y com.mattjakeman.ExtensionManager

# setup a box for megasync
distrobox-create --name fedora40_box --image fedora:40
distrobox-enter fedora40_box
sudo dnf install wget
wget https://mega.nz/linux/repo/Fedora_40/x86_64/megasync-Fedora_40.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_40.x86_64.rpm"
distrobox-export --app megasync

# set up virt manager user
sudo grep -E '^libvirt:' /usr/lib/group >> /etc/group
sudo usermod -a -G libvirt kevin

# optional if permission issue
#sudo restorecon -rv /var/lib/libvirt
#sudo restorecon -rv /var/log/libvirt
