---
name: acccheck
url: 'http://labs.portcullis.co.uk/tools/acccheck/'
description: >-
  A password dictionary attack tool that targets windows authentication via the
  SMB protocol.
group: blackarch blackarch-cracker
published: true
---
# acccheck

## Description
A password dictionary attack tool that targets windows authentication via the SMB protocol.

## Groups
- blackarch
- blackarch-cracker

## Tool functions
- Designed as a password dictionary attack tool that targets windows authentication via the SMB protocol.
- A wrapper script around the `smbclient` binary.

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S acccheck
```

## Usage examples
The simplest way to run the tool is to spevify the only the target. This will attempt a connection to the target's `ADMIN$` share with the username `Administrator` and a`<blank>` for the password.
```
acccheck -t 10.10.10.1
```
This mode of execution attempts to connect to the target's `IPC$` share with the username `test` and `test` for the password.
```
acccheck -t 10.10.10.1 -u test -p test
```
Each `-t`, `-u` and `-p` flags can be substituted by `-T`, `-U` and `-P`, where each represents an input file rather than a single input from standard in.
```
acccheck -T iplist -U userfile -P passwordfile
```
Only use `-v` mode on very small dictionaries, otherwise, this has the affect of slowing the scan down to the rate the system writes to standard out.

Any `<username>:<password>` combinations found are written to a file called `cracked` in the working directory.

## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
