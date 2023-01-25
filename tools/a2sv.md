---
name: a2sv
url: https://github.com/hahwul/a2sv
description: Auto Scanning to SSL Vulnerability.
group: blackarch blackarch-scanner
---

# a2sv

## Description
Auto Scanning to SSL Vulnerability.

## Groups
- blackarch
- blackarch-scanner

## Tool functions
Auto Scanning to SSL Vulnerability e.g. HeartBleed, CCS Injection, SSLv3 POODLE, FREAK, etc.

- CVE-2007-1858] Anonymous Cipher
- CVE-2012-4929] CRIME(SPDY)
- CVE-2014-0160] CCS Injection
- CVE-2014-0224] HeartBleed
- CVE-2014-3566] SSLv3 POODLE
- CVE-2015-0204] FREAK Attack
- CVE-2015-4000] LOGJAM Attack
- CVE-2016-0800] SSLv2 DROWN

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S a2sv
```

## Usage examples
### Scanning for SSL vulnerabilities
Scanninng a target with the `-t` argument without specifying any additional arguments will scan for all vulnerabilities:
```
a2sv -t 127.0.0.1
```
Scanning a target for a specific vulnerability by using the `-m` argument. Vulnerabilities in the tool are known as modules.
```
a2sv -t 127.0.0.1 -m heartbleed
```
Scanning a target with the `-d` (`--display`) argument with the `-n` argument will hide output.
```
a2sv -t 127.0.0.1 -d n
```
Scanning a target with the `-p` argument will allow you to specify a specific port. The default port is `443`. 
```
a2sv -t 127.0.0.1 -p 8111
```
Scanning a target with the `-f` argument allowws you to specify a list of targets to scan recursively. 
```
a2sv -tf target_list.txt
```

### Updating A2SV
You can check for updates via the tool.
```
a2sv -u
a2sv --update
```
Best practice to use `pacman -Syu` as BlackArch will package the updates.

## Additional Resources
- [poodle](https://github.com/supersam654/Poodle-Checker)
- [heartbleed](https://github.com/sensepost/heartbleed-poc)
- [ccs injection](https://github.com/Tripwire/OpenSSL-CCS-Inject-Test)
- [freak](https://gist.github.com/martinseener/d50473228719a9554e6a)


## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
