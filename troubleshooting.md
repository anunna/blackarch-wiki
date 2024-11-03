# Troubleshooting

### JDK/JRE 21 changes conflicts during package updates

Following a recent [change](https://archlinux.org/news/incoming-changes-in-jdk-jre-21-packages-may-require-manual-intervention/) (2023-11-02) from Arch Linux regarding JDK/JRE packages. You may run into dependency conflicts when updating your BlackArch Linux system and will require manual intervention.

Example of a conflict that may occure during a system update:
```shell
:: removing jre-openjdk breaks the dependency 'jre-openjdk' required by mobsf
:: removing jre-openjdk breaks the dependency 'jre-openjdk' required by tls-attacker
```
If you have installed BlackArch Linux using one of the currnet ISOs (dated 2023-04-01 or 2023-05-01) or earlier, you will need to execute the following command to address the JDK/JRE conflicts:
```shell
pacman -Rns mobsf tls-attacker jre-openjdk jdk-openjdk
pacman -Syyu
sysclean.sh
pacman -S blackarch --needed
```
### GNUPG 2.4.3-2 broken in Arch Linux and BlackArch Linux

After GNUPG updated to version 2.4 in Arch Linux with major upstream changes, there are issues with the blackarch-keyring being corrupted. This prevents you from running the `strap.sh` script, installing BlackArch packages. The team is working on fixing the keyring. 

There are two options to temporarily resolve the issue.

### Option 1

Downgrading to the previous version of GNUPG will resolve your issue.

```
pacman -U https://archive.archlinux.org/packages/g/gnupg/gnupg-2.2.41-2-x86_64.pkg.tar.zst
rm -rf /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate
pacman-key --update --keyserver keyserver.ubuntu.com
```

When runnnig system updates, use the `--ignore` flag to exclude gnupg or ignore gnupg in your `pacman.conf` file.

#### Example 1
Temporarily ignore the package during system update.
```
pacman -Syu --ignore gnupg
```

#### Example 2
Permanently ignoring the package.
```
sed -i '/IgnorePkg/ s/^#//; /IgnorePkg/ s/$/ gnupg/' /etc/pacman.conf
```

### Option 2

Add missing key
```
echo "F9A6E68A711354D84A9B91637533BAFE69A25079:4:" >> /usr/share/pacman/keyrings/blackarch-trusted
pacman-key --populate
```
Update the system to verify
```
pacman -Syu
```
