# run as anteneh

# generate ssh keys
ssh-keygen -t ed25519 -C "dev-machine"

# setup bspwm
sudo pacman -Syu --noconfirm && sudo pacman -S xorg xorg-xinit git wget --noconfirm && git clone https://aur.archlinux.org/bspwm-git.git && git clone https://aur.archlinux.org/sxhkd-git.git && cd bspwm-git && makepkg -si --noconfirm && cd .. && cd sxhkd-git && makepkg -si --noconfirm && cd .. && rm -rf bspwm-git sxhkd-git && install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc && install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc && mkdir ~/.wallpaper && wget -q -O ~/.wallpaper/current.png https://i.postimg.cc/knmQ1jTL/nord-japan.png?dl=1 && cp /etc/X11/xinit/xinitrc .xinitrc && sed -i '/twm/,$d' .xinitrc && echo -e '# user configuration\nfeh --bg-scale ~/.wallpaper/current.* &\nxsetroot -cursor_name left_ptr\npicom -f &\nexec bspwm' >> .xinitrc && echo '[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx' >> ~/.bash_profile && sed -i 's/urxvt/alacritty/' ~/.config/sxhkd/sxhkdrc && sed -i 's/dmenu_run/rofi -show run/' ~/.config/sxhkd/sxhkdrc

# install important packages
sudo pacman -S tmux htop neofetch vim bash-completion alacritty arandr rofi picom feh mpv scrot obs-studio pcmanfm chromium thunderbird telegram-desktop obsidian sqlitebrowser --noconfirm && git clone https://aur.archlinux.org/vscodium-bin.git && git clone https://aur.archlinux.org/postman-bin.git && git clone https://aur.archlinux.org/mongodb-compass.git && cd vscodium-bin && makepkg -si --noconfirm && cd .. && cd postman-bin && makepkg -si --noconfirm && cd .. && cd mongodb-compass && makepkg -si --noconfirm && cd .. && rm -rf vscodium-bin postman-bin mongodb-compass

# setup xRDP
git clone https://aur.archlinux.org/xrdp.git && git clone https://aur.archlinux.org/xorgxrdp.git && cd xrdp && makepkg -si --noconfirm && cd .. && gpg --recv-key 03993B4065E7193B && cd xorgxrdp && makepkg -si --noconfirm && cd .. && rm -rf xrdp xorgxrdp && sudo systemctl enable xrdp.service && sudo reboot