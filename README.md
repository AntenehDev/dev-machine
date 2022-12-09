# ArchLinux Dev-Machine on an LXC container

Download archlinux template named *archlinux-base-2022-11-1_amd64.tar.zst* from `CT Templates` in our Proxmox-VE host

## create an LXC container

| Items                  | Values          |
|------------------------|-----------------|
| CT ID                  | 100             |
| hostname               | dev             |
| unprivileged container | yes             |
| nesting                | yes             |
| disk                   | 45 GB           |
| template               | arch-amd64.tar  |
| CPU cores              | 2               |
| memory                 | 4096 MiB        |
| swap                   | 2048 MiB        |
| IPv4                   | 10.10.10.100/24 |
| gateway                | 10.10.10.254    |
| DNS                    | 10.10.10.254    |
| start at boot          | no              |

### run shell script

> we can't use `git clone https://github.com/AntenehDev/dev-machine` because we don't have *git and unzip* installed
+ *run as root*; update repo and create user `curl -O https://raw.githubusercontent.com/AntenehDev/dev-machine/main/user.sh && chmod +x user.sh && ./user.sh`
+ *run as anteneh*; generate ssh keys, setup bspwm, install important packages, and setup xRDP `curl -O https://raw.githubusercontent.com/AntenehDev/dev-machine/main/dev-machine.sh && chmod +x dev-machine.sh && ./dev-machine.sh`