
#  for info
 
#rpm-ostree rebase ostree-unverified-registry:ghcr.io/kkb301/gnome-41-1:41
#rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kkb301/gnome-41-1:41

# set up environment + flathub remove fedora

flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-delete fedora

# vital flatpaks to setup

flatpak install -y org.keepassxc.KeePassXC
flatpak install -y io.github.vikdevelop.SaveDesktop
flatpak install -y org.geany.Geany

# setup a box for megasync
distrobox-create --name fedora41_box --image fedora:41
distrobox-enter fedora41_box
sudo dnf install wget
wget https://mega.nz/linux/repo/Fedora_41/x86_64/megasync-Fedora_41.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_40.x86_64.rpm"
distrobox-export --app megasync

# set up virt manager user
sudo su
grep -E '^libvirt:' /usr/lib/group >> /etc/group
usermod -a -G libvirt kevin
exit

# turn of auto updates
sudo nano /etc/rpm-ostreed.conf  ###  stage to none

#copy timers to /var/home/kevin/.config/systemd/user
mkdir .config/systemd
mkdir .config/systemd/user
cp -a /usr/share/kevin/timers/. .config/systemd/user


systemctl --user enable backintime.timer --now
systemctl --user enable flatpak.timer --now
systemctl --user enable rpm-ostree.timer --now
# optional if permission issue when first trying to create

#sudo restorecon -rv /var/lib/libvirt
#sudo restorecon -rv /var/log/libvirt

#add kernal args
#rpm-ostree kargs --editor
#add next line to end
#  i8042.reset i8042.nomux i8042.nopnp i8042.noloop


#touchpad
#power stuff
#tweaks
