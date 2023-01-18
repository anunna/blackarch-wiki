# Getting Started

## Install BlackArch Linux
You can install BlackArch Linux in two ways. We offer a [CLI version](_wiki/blackarch-cli-install.md) for advanced users and a [GUI version](_wiki/blackarch-gui-install.md) for less experienced users.

It should be noted that the two installation types introduces some key differences in the environment.

### CLI Version
Name | Size | Description | Usecase | Managers
--- | --- | --- | --- | ---
BlackArch Full ISO | 15GB | The iso includes a large amount of tools, suitable to offline use. A functional live environment. The installer has the ability to install BlackArch without an internet connection, ensure that you have the latest version of the ISO to have the latest tool updates. | Offline Forensics Research | TTY, Fluxbox (default), AwesomeWM, Spectrwm, i3
BlackArch Netinstall ISO | 300MB | The iso only includes a minimal version of BlackArch Linux. No live environment, requires an internet connection for installation. Has access to over 2800 tools | Quick download, require latest tools, more flexibilty | TTY, Fluxbox (default), AwesomeWM, Spectrwm, i3 

### GUI Version
Name | Size | Description | Usecase | Managers
--- | --- | --- | --- | ---
BlackArch Slim ISO | 5GB | The iso includes only 50 popular tools on the live environment. Includes a desktop environment, suitable for less advanced users or users that prefer the confort of a Desktop environment. Includes the popular GUI installer, Calamares for simplicity. Includes CLI installer for advanced users. Slim ISO users still have access to over 2800 tools | Less experienced users, access to popular tools in a live environment, fits on DVD. | XFCE

## Other Versions
For users that have the disk capacity and bandwidth, the BlackArch team offers an OVA that includes all 2825 tools. Download, Extract or import into Virtual Box. Note that the import depends heavily on your disk performance and may take a long time. The extracted or imported OVA equals over 80GB disk space