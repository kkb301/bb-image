flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-delete fedora
flatpak install -y com.mattjakeman.ExtensionManager

