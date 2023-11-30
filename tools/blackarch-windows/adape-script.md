---
name: adape-script
url: https://github.com/hausec/ADAPE-Script
description: Active Directory Assessment and Privilege Escalation Script.
group: blackarch blackarch-windows blackarch-exploitation
---

# adape-script

## Description
The Active Directory Assessment and Privilege Escalation Script (ADAPE-Script) is a comprehensive tool designed to automate various tasks related to Active Directory (AD) assessment and privilege escalation. This script is not intended for red team operations, as it is quite loud and may not be suitable for those concerned about operational security.

The script is designed to simplify the process of running multiple scripts during a penetration test or risk assessment. It combines several commonly used PowerShell scripts into one, automating the collection process and outputting the results into a zip file.

## Groups
- blackarch
- blackarch-windows
- blackarch-exploitation

## Tool functions

- Gathers hashes via WPAD, LLMNR, and NBT-NS spoofing
- Checks for Group Policy Preference (GPP) password (MS14-025)
- Gathers hashes for accounts via Kerberoast
- Maps out the domain and identifies targets via BloodHound
- Checks for privilege escalation methods
- Searches for open SMB shares on the network
- Searches those shares and other accessible directories for sensitive files and strings (Passwords, PII, or whatever you want, really). By default, it's looking for the term "password". If you wanted to search for CVVs for example, you'd just add it next to 'password', e.g. password,cvv
- Checks patches of systems on the network
- Searches for file servers
- Searches attached shares
- Gathers the domain policy

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S adape-script
```

The script uses several modules, each with its own function and author. All modules in the script require Administrative access except for Bloodhound and PrivEsc (PowerUp). After running the .ps1, it will create the capture file in the same folder it's being run in and zips it. If you're running Windows 7 and below it won't zip, so you'll have to do that yourself. At the end of the script, it deletes all the folders it created (except the .zip file).

To use the script, you need to set the execution policy to Bypass and then run the script with the desired parameters. For example:
```
Set-ExecutionPolicy bypass
./ADAPE.ps1 -All
```
or
```
./ADAPE.ps1 -GPP -PView -Kerberoast
```
The script will be located in `/usr/share/windows/adape-script` and called `ADAPE.ps1`.

## Attack examples


## Additional Resources


## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
