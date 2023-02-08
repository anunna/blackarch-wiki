# FAQ

### Is BlackArch Linux the right pentesting distribution for me?

BlackArch Linux is a Linux pentesting distribution based on ArchLinux. If you're not familiar with ArchLinux, or Linux in general, we strongly suggest you avoid BlackArch due to the learning curve for new users.

### Where do I start with BlackArch?

You must first get an ISO on the [downloads](https://blackarch.org/downloads.html) page and install it by following the instructions of the installation script. You can find a [installation guide](/install_guide) to show the step by step process. If you encounter any problems and need help, the best place to ask is our [Matrix channel](https://matrix.to/#/%23BlackArch:matrix.org).

### Is BlackArch Linux up to date?

BlackArch is constantly being updated and offers the latest packages available on Github. We release a new ISO four times a year (quarterly). These new images contain packages that are up to date, and usually include bug fixes. If you find any package that is outdated and wish to see it up to date, please report it as an issue on our [Github](https://github.com/blackarch/blackarch) repository.

### How can I fetch/install the latest update available?

By simply running `pacman -Syu --needed --overwrite='*' blackarch`. This command requires root privileges.

### Why do I get invalid keyring signature?

It could happen for a wide range of reasons. Below you will find a few suggestions.

* You don't have an internet connection (as you can imagine, a rare problem and can be verified quickly).
* You may have a DNS problem, that can't resolve `pgp.mit.edu` accordingly. Please check your DNS settings (`pgp.mit.edu` works best with `8.8.8.8` DNS Server).
* You may have a network issue, different from the above one, which is hard for us to help since it can be a myriad of things e.g. DNS caching.
* You may have a clock/time issue.
* You may have something blocking your communication with `mit.edu.server` e.g. firewall.
* If you're connected through a VPN, try to temporarily disable it and run `strap.sh` again.
* Your keyring signatures may be out of date, this can be resolved by running `pacman -Sy && pacman -S archlinux-keyring blackarch-keyring`

After testing al lthe items described above, if you stil have problems using `strap.sh`, try the options below:

1st option:
```
rm -rf /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux blackarch
pacman-key --update --keyserver keyserver.ubuntu.com
```

2nd option:
You could try to change to pgp.mit.edu's IP address using the following command:
`nslookup pgp.mit.edu | awk '/^Name:/ {N=$2}; /^Address:/ {A=$2}; END {print A}'`
then run:
```
curl -O https://blackarch.org/strap.sh
chmod -x strap.sh
sha1sum strap.sh
sh strap.sh
```

3rd option:
You could try to temporarily switch to another mirror:
`sudoedit /etc/pacman.d/blacakrch-mirrorlist`
It's very important to follow the suggestions above as well as checking the [ArchLinux Wiki](https://wiki.archlinux.org) to assist you as needed. If you still encounter any problems; pay us a visit at [#BlackArch](https://matrix.to/#/%23BlackArch:matrix.org).

### Where can I get help for a problem that I'm facing?

Depending on the problem you're facing, you can visit our [Github](https://github.com/blackarch/blackarch) and submit an issue on our issue page, such as:
* [BlackArch repository](https://github.com/blackarch/blackarch/issues): related to our packages. For example: a package hasn't been updated or failed to run.
* [BlackARch Site repository](https://github.com/blackarch/blackarch-site/issues): related to our website. For example: If a link is broken or an image isn't loading.
* [BlackArch Installer repository](https://github.com/blackarch/blackarch-installer/issues): related to our installer. For example: the installation failed or you can not boot after a successful installation. 

You can also take some time to browse our other [repositories](https://guthub.com/blackarch).
If you still cannot find a soltuon to your problem, visit our [Matrix channel](https://matrix.to/#/%23BlackArch:matrix.org) and ask for help. But please be advised, BlackArch users are in different parts of the globe (different time zones). Therefor, be patient. Ask your question clearly and wait for a reply.

### How can I contribute to BlackArch?

BlackArch Linux is a huge project, we are adding new applications and features everyday. 
If you would like to help us with anytihng, visit our [Matrix channel](https://matrix.to/#/%23BlackArch:matrix.org). Just remember to wait for a reply, we are in different time zones.

### Troubleshooting

Checkout the [troubleshooting](/troubleshooting) for more solutions to common problems.
