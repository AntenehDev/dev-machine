# run as root

# update repo and then create new user
pacman-key --init && pacman-key --populate archlinux && pacman -Syu --noconfirm && pacman -S base-devel --noconfirm && useradd -mG wheel -s /bin/bash anteneh && passwd anteneh && sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers && exit && exit