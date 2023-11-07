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

