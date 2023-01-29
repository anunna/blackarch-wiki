---
name: ace
url: http://ucsniff.sourceforge.net/ace.html
description: Automated Corporate Enumerator.
group: blackarch blackarch-voip
---

# ace

## Description
ACE (Automated Corporate Enumerator) is a simple yet powerful VoIP Corporate Directory enumeration tool that mimics the behavior of an IP Phone in order to download the name and extension entries that a given phone can display on its screen interface. In the same way that the "corporate directory" feature of VoIP hardphones enables users to easily dial by name via their VoIP handsets, ACE was developed as a research idea born from "VoIP Hopper" to automate VoIP attacks that can be targeted against names in an enterprise Directory. The concept is that in the future, attacks will be carried out against users based on their name, rather than targeting VoIP traffic against random RTP audio streams or IP addresses. ACE works by using DHCP, TFTP, and HTTP in order to download the VoIP corporate directory. It then outputs the directory to a text file, which can be used as input to other VoIP assessment tools. ACE is a standalone utility, but its functions are integrated into UCSniff

## Groups
- blackarch
- blackarch-voip

## Tool functions
ACE currently supports the VoIP corporate directory used in Cisco Unified IP Phones. It works in the following way:

- Spoofs CDP to get VVID
- Adds Voice VLAN Interface (VLAN Hop) - subsequent traffic is tagged with VVID
- Sends DHCP request tagged with VVID
- Decodes TFTP Server IP Address via DHCP Option 150
- Sends a TFTP request for IP Phone configuration file
- Parses file, learning Corporate Directory URL
- Sends an HTTP GET request for Directory
- Parses XML Data, writing directory users to a formatted text file

## Installation
Instructions on how to install the tool or package on BlackArch Linux.
```
pacman -S ace
```

## Usage examples
ACE can be used in one of two ways. First, it can auto-discover the TFTP Server IP Address via DHCP, or (second) the user can specify the TFTP Server IP address as a command line parameter of the tool. In either case, you must supply the MAC Address of the IP Phone with the -m option in order for the tool to correctly download the configuration file via TFTP.

Usage requires MAC address of IP Phone supplied with `-m` option:
```
ace -t -m
```
Mode to automatically discover TFTP Server IP via DHCP Option 150 (-m):
```
ace -i eth0 -m 00:1E:F7:28:9C:8E
```
Mode to specify IP Address of TFTP Server:
```
ace -i eth0 -t 192.168.10.150 -m 00:1E:F7:28:9C:8E
```
Mode to specify the Voice VLAN ID
```
Example: ace -i eth0 -v 96 -m 00:1E:F7:28:9C:8E
```
Verbose mode
```
Example: ace -i eth0 -v 96 -m 00:1E:F7:28:9C:8E -d
```
Mode to remove vlan interface
```
Example: ace -r eth0.96
```
Mode to auto-discover voice vlan ID in the listening mode for CDP
```
Example: ace -i eth0 -c 0 -m 00:1E:F7:28:9C:8E
```

Mode to auto-discover voice vlan ID in the spoofing mode for CDP
```
Example: ace -i eth0 -c 1 -m 00:1E:F7:28:9C:8E
```

## Additional Resources


## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
