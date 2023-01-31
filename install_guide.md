# Installation Guide

This document is a guide for installing BlackArch Linux using the live system booted from blackarch-linux-full or blackarch-linux-netinst made from an offical installation image. 

BlackArch Linux should run on any x86_64 compatible machine with a minimum of 512MB RAM if opting out to installing [X display](https://wiki.archlinux.org/title/Xorg) and [Window Managers](https://wiki.archlinux.org/title/Window_manager), 1GB is recommended as more memory is needed to boot a live medium. An alternataive installation of BlackArch Linux using the live system booted from blackarch-linux-slim installation media should also run on any x86_64 compatible machine with a minimum of 1GB (2GB Recommended).

## Installers
BlackArch Linux offers two installers for your preference. Each bundled as a default depending on the ISO you have selected.

### blackarch-installer

The standard installer for BlackArch Linux is a guided CLI installer which might seem difficult to many users trying out BlackArch Linux. However, it is a guided installer with a series of options for you to select, or accept the defaults selected by the BlackArch team.

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