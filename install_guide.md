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

### Online installation

#### Installation Modes

Select option 1 from the installation modes.It is recommended to select verbose installation in order to observe the installation progress and take note of any errors that may occur.

#### Keymaps

The default keymap is `en`. You may select a preferred keymap from the list of available keymaps.

#### Hostname

Enter your preferred hostname.

#### Networking

Your system will automatically detect all network interfaces in your system. Type out your preferred network interface and skip device configuration if you are already connected to the internet. This is confirmed when the script is launched because the script checks for an updated version of itself. If not connected, select option option 1.

#### Partitions

Validate your system boot type. Most modern systems boots UEFI by default. If your computer was manufactured prior to 2017, please confirm whether you have booted UEFI or BIOS/MBR.

UEFI systems must create a GPT partition scheme. You will be prompted for the type once you boot into `CFDISK` as prompted. CFDISK wipes the entire disk, please proceed with caution. Should you wish to setup dual boot, first create your partions via `FDISK` (Recommended for advanced users). 

Default partition layout:
- BOOT (/boot): 1GB
- SWAP (SWAP): x2 system memory e.g., 16GB system memory = 32GB SWAP. This is a best practice guidline only and you may proceed with your own preferrence. 
- ROOT (/): This will vary depending on whether you wish to install all BlackArch tools or not. 60 - 120 GB disk size.

In `CFDISK`, create the BOOT partition. Select the `EFI Filesystem` parition type. For the swap partition, assign the `Linux swap / Solaris` type. For the root, leave default on `Linux` and write all your changes before exiting. 

##### Encryption

Select whether you would like a fully encrypted root partition and set a password. Note you will need to remember this password and enter each time you boot your BlackArch system. 

Complete the harddrive configuration by matching your partitions and selecting your desired filesystem. 

E.g., 
- Boot partition: /dev/sda1
- Root partition: /dev/sda3 
	- FS Type: ext4
- Swap parition: /dev/sda2
	- or leave blank if no swap partition is required.

#### Accounts

Set the root password. Enter details for your personal account should you have one created.

#### Mirrors

Select from the list your preferred mirror. Note this can be manually changed or updated in `/etc/pacman.d/blackarch-mirrorlist` by commenting out the mirrors your want. Alternatively you can install `rankmirrors` e.g., `rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/blackarch-mirrorlist`

##### Window Managers

You the choice to install xorg-server with one or all Window Managers. If you opt out, your system will boot TTY and you have to manually set it up. 

All blackarch environment configs are avialable in the repository as following:

```
blackarch-config-fluxbox
blackarch-config-spectrwm
blackarch-config-awesome
blackarch-config-i3
blackarch-config-xfce
blackarch-config-vim
blackarch-config-gtk
blackarch-config-zsh
blackarch-config-icons
blackarch-config-openbox
blacakrch-config-bash
blackarch-config-x11
blackarch-config-lxdm
```

Reboot and you can enjoy your newly setup BlackArch Linux machine. 

### Offline installation

#### Installation Modes

Select option 2 from the installation modes. It is recommended to select verbose installation in order to observe the installation progress and take note of any errors that may occur.

##### Keymaps

The default keymap is `en`. You may select a preferred keymap from the list of available keymaps.

##### Hostname

Enter a name for your host.

You wil be required to configure your partitons

## Calamares method

This guide assumes you have already downloaded and created your bootable BlackArch Linux medium. The Calamares installer is bundled with the Slim ISO.
