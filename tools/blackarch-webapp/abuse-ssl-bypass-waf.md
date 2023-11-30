---
name: abuse-ssl-bypass-waf
url: https://github.com/LandGrey/abuse-ssl-bypass-waf
description: Bypassing WAF by abusing SSL/TLS Ciphers.
group: blackarch blackarch-webapp blackarch-fuzzer
---

# abuse-ssl-bypass-waf

## Description
Bypassing WAF by abusing SSL/TLS Ciphers.

## Groups
- blackarch
- blackarch-webapp
- blackarch-fuzzer

## Tool functions
Helping you find the SSL/TLS Cipher that WAF cannot decrypt and Server can decrypt same time.

![logic-diagram](../media/abuse-ssl-bypass-waf-mind.png)

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S abuse-ssl-bypass-waf
```

## Usage examples
If you can find a keyword or regex when hitting the WAF page, you can use:
```
abuse-ssl-bypass-waf -regex "regex" -target https://target.com
```
If no keywords or regex is present, you can use:
```
abuse-ssl-bypass-waf -thread 4 -target https://target.com
```
**NOTE:** If you are worried about the WAF dropping the connection, it is better to exclude the `-thread` argument for your scan. 

### Visual Examples
If you don't know what the WAF type is, you can compare the HTML response contect lenght ad try to find the bypassing WAF ciphers.
<details>
<summary role="button">Click to expand image</summary>
<img src="/media/abuse-ssl-bypass-waf-example1.png"
/>
</details>

If you know the keyword or regex for the WAF:
<details>
<summary role="button">Click to expand image</summary>
<img src="/media/abuse-ssl-bypass-waf-example2.png"
/>
</details>

When utilizing certain SSL/TLS ciphers to request a payload URL, if a WAF keyword or regular expression is not present in the HTML page, it is possible to bypass the WAF by utilizing the Cipher.
<details>
<summary role="button">Click to expand image</summary>
<img src="/media/abuse-ssl-bypass-waf-example3.png"
/>
</details>

## Additional Resources
Additional information on Bypassing Web-Application Firewalls by abusing SSL/TLS can be found [here](https://0x09al.github.io/waf/bypass/ssl/2018/07/02/web-application-firewall-bypass.html).

## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
