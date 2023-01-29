---
name: aclpwn
url: https://github.com/fox-it/aclpwn.py
description: Active Directory ACL exploitation with BloodHound.
group: blackarch blackarch-exploitation
---

# aclpwn

## Description
A tool that interacts with BloodHound to identify and exploit ACL based privilege escalation paths. It takes a starting and ending point and will use Neo4j pathfinding algorithms to find the most efficient ACL based privilege escalation path. Aclpwn.py is similar to the PowerShell based [Invoke-Aclpwn](https://github.com/fox-it/Invoke-ACLPwn).

## Groups
- blackarch
- blackarch-exploitation

## Tool functions
- Direct integration with BloodHound and the Neo4j graph database (fast pathfinding)
- Supports any reversible ACL based attack chain (no support for resetting user passwords right now)
- Advanced pathfinding (Dijkstra) to find the most efficient paths
- Support for exploitation with NTLM hashes (pass-the-hash)
- Saves restore state, easy rollback of changes
- Can be run via a SOCKS tunnel
- Written in Python (2.7 and 3.5+), so OS independent

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S aclpwn
```

## Usage examples


## Additional Resources


## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
