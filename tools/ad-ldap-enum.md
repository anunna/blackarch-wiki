---
name: ad-ldap-enum
url: https://github.com/CroweCybersecurity/ad-ldap-enum
description: An LDAP based Active Directory user and group enumeration tool.
group: blackarch blackarch-recon
---

# ad-ldap-enum

## Description
An LDAP based Active Directory object (users, groups, computers) enumeration tool.

## Groups
- blackarch
- blackarch-recon

## Tool functions
- Enumerates users, computers, and their group memberships from Active Directory.
- Executes LDAP queries against a domain controller to target specific Active Directory attributes and quickly build out group membership.
- Outputs three tab-delimited files: `Domain_Group_Membership.csv`, `Extended_Domain_User_Information.csv`, and `Extended_Domain_Computer_Information.csv`.
- Supports both authenticated and unauthenticated LDAP connections.
- Can process nested groups and display a user's actual group membership.
- Supports password and Pass-the-Hash (PtH) LM:NTLM style authentication.
- Supports LDAP over SSL/TLS connections, IPv4, and IPv6 networks.
- Allows the addition of more attributes to the non-legacy version by finding the attribute's formatted name, appending the attribute to the applicable object list within `user_attribures`, `group_attributes`, or `computer_attributes`, updating the object's class to have a default value, parsing the retrieved attribute in the object's class, and updating the object's output section to include appending the new attribute header and value.
- The tool is OS-agnostic and works on both UNIX/Linux systems and Windows.

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S ad-ldap-enum
```

## Usage examples
Basic usage example:
```
ad-ldap-enum -d contoso.com -l 10.0.0.1 -u 'Administrator' -p 'P@ssw0rd' -o 'ad-ldap-enum_2' --verbosity BASIC -lf 'ad-ldap-enum_Log.txt'
```
Pass-the-Hash LDAPS authentication:
```
ad-ldap-enum -d contoso.com -l 10.0.0.1 -s -u 'Administrator' -p 'aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0'
```
Null Binding Authentication:
```
ad-ldap-enum -n -l ldap.contoso.com -d contoso.com
```
Prompt for Password Authentication:
```
ad-ldap-enum -u 'Administrator' -P -l ldap.contoso.com -d contoso.com
```
Secure LDAP Connection: This example connects to LDAP over SSL/TLS:
```
ad-ldap-enum -u 'Administrator' -p 'P@ssw0rd' -s -l ldap.contoso.com -d contoso.com
```
Timeout and Query Limit: This example sets a timeout for the LDAP server connection and query limit:
```
ad-ldap-enum -u 'Administrator' -p 'P@ssw0rd' -t 10 -ql 20 -l ldap.contoso.com -d contoso.com
```
Legacy Format: This example gathers and outputs attributes using the old python-ldap package .tsv format:
```
ad-ldap-enum -u 'Administrator' -p 'P@ssw0rd' --legacy -l ldap.contoso.com -d contoso.com
```
Excel Output: This example outputs an .XLSX with all 3 sheets: users/groups/computers:
```
ad-ldap-enum -u 'Administrator' -p 'P@ssw0rd' -x -l ldap.contoso.com -d contoso.com
```
Nested Groups: This example expands nested groups:
```
ad-ldap-enum -u 'Administrator' -p 'P@ssw0rd' -e -l ldap.contoso.com -d contoso.com
```
IPv4 Networking
```
ad-ldap-enum -u 'Administrator' -p 'P@ssw0rd' -4 -l ldap.contoso.com -d contoso.com
```
IPv6 Networking
```
ad-ldap-enum -u 'Administrator' -p 'P@ssw0rd' -6 -l ldap.contoso.com -d contoso.com
```

## Additional Resources


## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
