---
name: activedirectoryenum
url: https://github.com/CasperGN/ActiveDirectoryEnumeration
description: Enumerate AD through LDAP.
group: blackarch blackarch-recon
---

# activedirectoryenum

## Description
Enumerate AD through LDAP with a collection of helpfull scripts being bundled.

## Groups
- blackarch
- blackarch-recon

## Tool functions
Included attacks/vectors
- ASREPRoasting
- Kerberoasting
- Dump AD as BloodHound JSON files
- Searching GPOs in SYSVOL for cpassword and decrypting
- Run without creds and attempt to gather for further enumeration during the run
- Sample exploits included:
- CVE-2020-1472

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S activedirectoryenum
```

## Usage examples
To query an exploit for PoC code:
```
ade --exploit cve-2020-1472
```

## Additional Resources


## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
