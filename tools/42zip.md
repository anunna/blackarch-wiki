---
name: 42zip
url: http://blog.fefe.de/?ts=b6cea88d
description: Recursive Zip archive bomb.
group: blackarch blackarch-dos
---

# 42zip

## Description
A recursive ZIP archive bomb.

## Groups
- blackarch
- blackarch-dos

## Tool functions
- This ZIP archive contains zeros. Only zeros. No code. Null bytes. MANY zero bytes.
- The whole thing zipped, the result zipped again, the whole thing zipped again, various iterations, so that the ZIP file is 42K in the end, but the unpacked data takes up a few terabytes or so on the disk. 
- An antivirus can either scan this, then occupy all disk space and CPU time for quite a while, and as long as it renders it unusable (and thus failed its mission), or abandon it (and thus failed to fulfill its mission).

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S 42zip
```

## Usage examples
The ZIP file is copied to `/usr/share/42zip/42.zip` during installaton. If extracted, you will find terabytes of zero data. The point is for antivirus tools to scan the archive occupying system resources and the antivirus tool for large amounts of time while attempting to scan multiple archives within each other impacting system resources and making the antivirus tool useless. 

## Additional Resources
See [Fefe's Blog](http://blog.fefe.de/?ts=b6cea88d)

## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
