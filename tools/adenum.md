---
name: adenum
url: https://github.com/SecuProject/ADenum
description: AD Enum is a pentesting tool that allows to find misconfiguration through the the protocol LDAP and exploit some of those weaknesses with kerberos.
group: blackarch blackarch-exploitation blackarch-scanner
---

# adenum

## Description
AD Enum is a powerful tool for identifying and exploiting vulnerabilities in Active Directory environments. By leveraging LDAP and Kerberos protocols, it can enumerate various types of users and objects, crack hashes, and check for AS-REP roastable users.

## Groups
- blackarch
- blackarch-exploitation
- blackarch-scanner

## Tool functions
### LDAP
- Enum Domain Admin users
- Enum Domain Controllers
- Enum Domain users with Password Not Expire
- Enum Domain users with old password
- Enum Domain users with interesting description
- Enum Domain users with not the default encryption
- Enum Domain users with Protecting Privileged Domain Accounts
- Enum Domain users with not default object Attributes

### Kerberos
- AS-REP Roastable
- Kerberoastable
- Password cracking with john  (krb5tgs and krb5asrep)

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S adenum
```

## Attack examples
### Basic usage
To perform a basic enumeration of an Active Directory domain, use the following command structure:
```
adenum -d <DOMAIN_NAME> -u <USERNAME> -p <PASSWORD>
```
Replace `<DOMAIN_NAME>`, `<USERNAME>`, and `<PASSWORD>` with the actual domain name, username, and password you wish to use for authentication.

### Advanced options
Specify Server IP: You can specify the IP address of the server you're targeting with the `-ip` option:
```
adenum -d <DOMAIN_NAME> -u <USERNAME> -p <PASSWORD> -ip <SERVER_IP>
```
Enable Hash Cracking: To enable hash cracking using John the Ripper, use the `-j` flag. You can also specify the path to the John binary with `-jp` and provide a custom wordlist with `-w`:
```
adenum -d <DOMAIN_NAME> -u <USERNAME> -p <PASSWORD> -j -jp /path/to/john -w /path/to/custom_wordlist
```
Use LDAP over SSL: To enforce the use of LDAP over SSL, add the `-s` flag:
```
adenum -d <DOMAIN_NAME> -u <USERNAME> -p <PASSWORD> -s
```
Check for ASREP Roastable Users: To check for users who might be vulnerable to AS-REP Roasting, use the `--NPUsersCheck` option:
```
adenum -d <DOMAIN_NAME> -u <USERNAME> -p <PASSWORD> --NPUsersCheck
```

## Additional Resources
### Developer Demo Video
[![asciicast](https://asciinema.org/a/362017.svg)](https://asciinema.org/a/362017?autoplay=1)

### Microsoft Advanced Threat Analytics

ATA detects two suspicious events but does **not** trigger an **alert**:

- The connection with the protocol LDAP without SSL
- The Kerberoastable attack

As shown in this screenshot:

![media/ATAdetection.png](/media/ATAdetection.png)

### Documentation:

- <https://labs.f-secure.com/blog/attack-detection-fundamentals-discovery-and-lateral-movement-lab-1/>
- <https://theitbros.com/ldap-query-examples-active-directory/>
- <https://docs.microsoft.com/en-us/advanced-threat-analytics/what-is-ata>

### Impacket:

- <https://github.com/SecureAuthCorp/impacket/blob/master/examples/GetNPUsers.py>
- <https://github.com/SecureAuthCorp/impacket/blob/master/examples/GetUserSPNs.py>

## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
