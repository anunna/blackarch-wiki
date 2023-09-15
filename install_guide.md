# Installation Guide

This document is a guide for installing BlackArch Linux using the live system booted from blackarch-linux-full or blackarch-linux-netinst made from an offical installation image. 

BlackArch Linux should run on any x86_64 compatible machine with a minimum of 512MB RAM if opting out to installing [X display](https://wiki.archlinux.org/title/Xorg) and [Window Managers](https://wiki.archlinux.org/title/Window_manager), 1GB is recommended as more memory is needed to boot a live medium. An alternataive installation of BlackArch Linux using the live system booted from blackarch-linux-slim installation media should also run on any x86_64 compatible machine with a minimum of 1GB (2GB Recommended).

## Installers
BlackArch Linux offers two installers for your preference. Each bundled as a default depending on the ISO you have selected.

### blackarch-installer

The standard installer for BlackArch Linux is a guided CLI installer. While it may appear daunting to some users trying out BlackArch Linux, it offers a series of options for customization. You can either select your preferences or simply accept the defaults chosen by the BlackArch team.

The [blackarch-installer](https://github.com/BlackArch/blackarch-installer) can be installed from the BlackArch repository as well.
```
pacman -S blackarch-installer
```
Executed as:
```
blackarch-install
```

### Calamares

The standard installer for the Slim ISO and many graphical Linux distributions. Most users familiar with Linux would have come accross the [Calamares](https://github.com/BlackArch/blackarch-config-calamares) installer. Calamares is a graphically guided installer focused on simplicity for the average user. 

## ISO types

We have a number of options for your convenience as follow:
- Blackarch-linux-full
- Blackarch-linux-netinstall
- Blackarch-linux-slim

### Blackarch-linux-full

BlackArch-Linux-Full is the most popular ISO because it's suitable for offline use and offline installation. It is bundled with a graphical live environment, five popular [Window Managers](https://wiki.archlinux.org/title/Window_manager) for you to choose from, and all tools in the BlackArch Linux repository. Please note that this is a large download. If you choose to run the installation online, be cautious of your bandwidth limitations due to the size of the entire repository.

The default window manager is [fluxbox](http://fluxbox.org/).
Other options include:
- [i3](https://i3wm.org/): Tiling window manager.
- [AwesomeWM](https://awesomewm.org/): Highly configurable, next gen framework window manager. Configured in Lua.
- [Spectrwm](https://github.com/conformal/spectrwm): Small dynamic tiling window manager, largely inspired by xmonad and dwm.
- [Openbox](http://openbox.org/): Highly configurable window manager with extensive standards support.

These window managers are selectable at the greeter.

Username: `root`
Password: `blackarch`

Networking is disabled by default on the live environment for various professional reasons, e.g., Forensic Analysis.

Networking is managed by systemd and can be enabled with `systemctl enable --now systemd-networkd && dhcpcd`. For further reading please see [systemd-networkd](https://wiki.archlinux.org/title/Systemd-networkd).

Wireless networking is managed by [iwd](https://wiki.archlinux.org/title/Iwd).
```
iwctl station wlan0 connect <SSID>
```

### Blackarch-linux-netinstall

Blackarch-linux-netinstall provides a smaller download option with a minimal live environment (TTY only). However, please note that it requires an internet connection for installation, and you won't be able to run blackarch-install in offline mode. You still have the option to install all tools, similar to the blackarch-linux-full installation. Be aware that if you opt for the full toolset, the download size will be approximately 100GB.

### Blackarch-linux-slim

Blackarch-linux-slim is our latest addition, designed for both general security professionals and newcomers to Arch Linux or Linux in general. This ISO includes a user-friendly Desktop Manager and features a curated selection of 50 popular security tools. It's ideal for users seeking a smaller download size while still needing a convenient live environment.

#### Key Features

- XFCE Desktop: Enjoy a user-friendly XFCE Desktop Manager for a comfortable experience.
- Curated Tools: Benefit from a selection of 50 carefully chosen popular security tools. [View the list](/slim-tools).
- Easy Installation: Utilize Calamares, a graphical installer, for a hassle-free setup.
- Installation Options: Access the versatile blackarch-installer, available via the CLI, as standard on the full and netinstall ISOs.
- Full Repository: Access the complete BlackArch repository (internet connection required) for an extensive range of tools and resources.

Username: `root`
Password: `blackarch`

## blackarch-install CLI method

This guide assumes you have already downloaded and created your bootable BlackArch Linux medium. The `blackarch-install` script is bundled with the full and netinstall ISO. 

You may open a terminal by right clicking on the desktop and run `blackarch-install`. You will be prompted for your installation type, i.e., offline or online.

### Offline installation

You have selected the offline installation method. It is recommended to select verbose installation in order to observe the installation status and take note of any errors that may occur.

You wil be required to configure your partitons

## Calamares method

This guide assumes you have already downloaded and created your bootable BlackArch Linux medium. The Calamares installer is bundled with the Slim ISO.
