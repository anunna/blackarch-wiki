---
name: 0trace
url: http://jon.oberheide.org/0trace/
description: A hop enumeration tool.
group: blackarch blackarch-scanner
---

# 0trace

## Description
0trace is a python port of [Michal Zalewski’s](http://lcamtuf.coredump.cx/) 0trace hop enumeration tool. A security reconnaissance / firewall bypassing tool. This tool enables the user to perform hop enumeration ("traceroute") within an established TCP connection, such as an HTTP or SMTP session. This is opposed to sending stray packets, as traceroute-type tools usually do. 

The important benefit of using an established connection and matching TCP packets to send a TTL-based probe is that such traffic is happily allowed through by many stateful firewalls and other defenses without further inspection (since it is related to an entry in the connection table).

## Groups

- blackarch
- blackarch-scanner

## Tool functions

- Security reconnaissance
- Firewall bypassing

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S 0trace
```

## Usage examples
### Open a TCP connection:
```
telnet <target-ip> 80
```

### Start 0trace
```
0trace <NIC> <target-ip> 80
```

### Initiate some TCP activity in telnet session - GET/HTTP/1.0

`telnet 66.135.192.87 80`

`0trace eth0 66.135.192.87 80`
```
[+] Waiting for traffic from target on eth0...
[+] Traffic acquired, waiting for a gap...
[+] Target acquired: 192.168.0.10:54403 -> 66.135.192.87:80 (3736223256/873025975)
[+] Setting up a sniffer...
[+] Sending probes...

TRACE RESULTS
-------------
1 192.168.0.1
3 68.87.187.29
4 68.87.190.161
5 68.87.190.157
6 68.87.190.153
7 68.87.190.149
8 68.87.190.145
9 68.87.190.141
10 68.87.191.145
11 12.116.11.101
12 12.123.139.150
13 12.122.10.134
14 12.123.4.249
15 192.205.33.158
16 144.232.20.20
17 144.232.26.109
18 144.232.20.161
19 144.232.15.142
20 144.232.20.141
21 144.232.20.113
22 144.232.0.250
23 144.228.110.122
24 66.135.207.186
Target reached.
```

## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
