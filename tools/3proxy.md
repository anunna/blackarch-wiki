---
name: 3proxy
url: 'http://3proxy.ru/'
description: Tiny free proxy server.
group: blackarch blackarch-proxy
published: true
---

# **3proxy**

## Description
A Tiny free proxy server.

## Groups
- blackarch
- blackarch-proxy

## Tool functions
### General
- IPv6 support for incoming and outgoing connection, cna be used as a proxy between IPv4 and IPv6 networks in either direction.
- HTTP/1.1 Proxy with keep-alive client and server support, transparent proxy support.
- HTTPS (CONNECT) proxy (compatible with HTTP/2 / SPDY).
- Anonymous and random client IP emulation for HTTP proxy mode.
- FTP over HTTP support.
- DNS caching with built-in resolver.
- DNS proxy
- DNS over TCP support, redirecting DNS traffic via parent proxy.
- SOCKSv4/4.5 Proxy
- SOCKSv5 Proxy
- SOCKSv5 UPD and BIND support (fully compatible with SocksCAP/FreeCAP for UDP).
- Transparent SOCKS redirection for HTTP, POP3, FTP, SMTP.
- POP3 Proxy.
- FTP Proxy.
- TCP port mapper (port forwarding).
- UDP port mapper (port forwarding).
- SMTP Proxy.
- Threaded application (no child process)
- Web administration and statistics.
- Plugins for functionality extensions.
- Native 32/64 bit application.

### Proxy chaining and network connections
- Can be used as a bridge between client and different proxy type (e.g. convert incoming HTTP proxy request from client to SOCKSv5 request to parent server).
- Connect back proxy support to bypass firewalls
- Parent proxy support for any type of incoming connection
- Username/password authentication for parent proxy(s).
- HTTPS/SOCKS4/SOCKS5 and IP/port redirection parent support
- Random parent selection
- Chain building (multi hop proxy)
- Load balancing between few network connections by choosing network interface

### Logging
- Tuneable log format compatible with any log parser
- Stdout logging
- File logging
- Syslog logging (Unix)
- ODBC logging
- RADIUS accounting
- Log file rotation
- Automatic log file processing with external archiver (for files)
- Character filtering for log files
- Different log files for different services are supported

### Access control
- ACL-driven Access control by username, source IP, destination IP/hostname, destination port and destination action (POST, PUT, GET, etc), weekday and daytime.
- ACL-driven (user/source/destination/protocol/weekday/daytime or combined) bandwidth limitation for incoming and (!)outgoing traffic.
- ACL-driven traffic limitation per day, week or month for incoming and outgoing traffic
- Connection limitation and rate limiting
- User authentication by username / password
- RADIUS Authentication and Authorization
- User authentication by DNS hostname
- Authentication cache with possibility to limit user to single IP address
- Access control by username/password for SOCKSv5 and HTTP/HTTPS/FTP
- Clear text or encrypted (crypt/MD5 or NT) passwords.
- Connection redirection
- Access control by requested action (CONNECT/BIND, HTTP GET/POST/PUT/HEAD/OTHER).
- All access control entries now support weekday and time limitations
- Hostnames and * templates are supported instead of IP address

### Extensions
- Regular expression filtering (with PCRE) via PCREPlugin
- Authentication with Windows username/password (clear text only)
- SSL/TLS decryption with certificate spoofing
- Transparent redirection support for Linux and *BSD

### Configuration
- Support for configuration files
- Support for includes in configuration files
- Interface binding
- Socket options
- Running as daemon process
- Utility for automated networks list building
- Configuration reload on any file change

**Unix**
- Support for chroot
- Support for setgid
- Support for setuid
- Support for signals (SIGUSR1 to reload configuration)

**Windows**
- Support `--install` as service
- Support `--remove` as service
- Support for service START, STOP, PAUSE and CONTINUE commands (on PAUSE no new connection accepted, but active connections still in progress, on CONTINUE configuration is reloaded)

**Windows 95/98/ME**
- Support `--install` as service
- Support `--remove` as service

### Compilation
- MSVC (static)
- OpenWatcom (static)
- Intel Windows Compiler (msvcrt.dll)
- Windows/gcc (msvcrt.dll)
- Cygwin/gcc (cygwin.dll)
- Unix/gcc
- Unix/ccc
- Solaris
- Mac OS X, iPhone OS
- Linux and derivered systems
- Lite version for Windows 95/98/NT/2000/XP/2003
- 32 bit and 64 bit versions for Windows Vista and above, Windows 2008 Server and above 

### 3proxy    	
Combined proxy server may be used as executable or service (supports installation and removal). It uses config file to read it's configuration (see [3proxy.cfg.sample](https://github.com/3proxy/3proxy/blob/master/cfg/3proxy.cfg.sample) for details). `3proxy.exe` is an all-in-one, it doesn't require additional executables to work. See [3proxy.cfg.sample](https://github.com/3proxy/3proxy/blob/master/cfg/3proxy.cfg.sample) for examples, see `man 3proxy.cfg`.

| Function | Description |
|---|---------|
| proxy | HTTP proxy server, binds to port `3128` |
| ftppr | FTP proxy server, binds to port `21` |
| socks | SOCKS 4/5 proxy server, binds to port `1080` |
| ftppr | FTP proxy server, please do not mess it with FTP over HTTP proxy used in browsers |
| pop3p | POP3 proxy server, binds to port `110`. You must specify POP3 username as `username@target.host.ip[:port]` port is `110` by default. Example: in Username configuration for you e-mail reader set someuser@pop.example.org, to obtains mail for someuser from pop.somehost.ru via proxy. |
| smtpp | SMTP proxy server, binds to port `25`. You must specify SMTP username as `username@target.host.ip[:port]` port is `25` by default. Example: in Username configuration for you e-mail reader set someuser@mail.example.org, to send mail as someuser via mail.somehost.ru via proxy. |
| tcppm | TCP port mapping. Maps some TCP port on local machine to TCP port on remote host. |
| udppm | UDP port mapping. Maps some UDP port on local machine to UDP port on remote machine. Only one user simulationeously can use UDP mapping, so it cann't be used for public service in large networks. It's OK to use it to map to DNS server in small network or to map Counter-Strike server for single client (you can use few mappings on different ports for different clients in last case). |
| mycrypt | Program to obtain crypted password fro cleartext. Supports both MD5/crypt and NT password. |
	mycrypt password
	produces NT password
	mycrypt salt password
	produces MD5/crypt password with salt "salt".

## Installation
Instructions on how to install the tool or package on BlackArch Linux.

```
pacman -S 3proxy
```

## Usage examples

### Adding users
	/etc/3proxy/conf/add3proxyuser.sh <username> <password> [day_limit] [bandwidth]

`day_limit` - traffic limit in MB per day.

`bandwidth` - bandwidth in bits per second 1048576 = 1mbps

or modify `/etc/3proxy/conf/` files directly.

## Additional Resources
### Docker
Docker images [here](https://github.com/z3APA3A/3proxy)

2 docker configurations are provided, defaul (full) and `:minimal` for devel and stable 3proxy versions. `:latest` is a full configuration for stable version.

Default configuration:
Dockerfile with fully dunctional busibox:glibc based 3proxy installation, requires mounting configuration file.

To build: 

	docker build -f Dockerfile.full -t 3proxy

To run:
By default 3proxy uses safe chroot environment with chroot to /usr/local/3proxy with uid/gid 65535/65535 and expects configuration file to be placed in /usr/local/etc/3proxy. Paths in configuration file must be relative to /usr/local/3proxy, that is use /logs instead of /usr/local/3proxy/logs. nserver in chroot is required for DNS resolution.
Example:
```
echo nserver 8.8.8.8 >/path/to/local/config/directory/3proxy.cfg
echo proxy -p3129 >>/path/to/local/config/directory/3proxy.cfg
docker run -p 3129:3129 -v /path/to/local/config/directory:/usr/local/3proxy/conf -name 3proxy.full 3proxy
```
`/path/to/local/config/directory` in this example must contain `3proxy.cfg` if you need 3proxy to be executed without chroot with root permissions, replace `/etc/3proxy/3proxy.cfg` by e.g. mounting config dir to `/etc/3proxy` or by providing config file `/etc/3proxy/3proxy.cfg`

`docker run -p 3129:3129 -v /path/to/local/config/directory:/etc/3proxy -name 3proxy 3proxy`

use `log` without pathname in config to log to stdout or mount volume for logs. plugins are located in `/usr/local/3proxy/libexec` (/libexec for chroot config). Some proxy types (e.g. SOCKSv5 UDPASSCOC, SOCKSv5 BIND functionality, ftp proxy) require access to ephemeral port, you may use e.g. `--network` host mode or `-P` for `docker run`.

This is busybox based docker with only 3proxy executable and empty non-writable "run" directory.

`plugin` is not supported.

Build:

	docker build -f Dockerfile.minimal -t 3proxy.minimal


Run example:

	docker run -i -p 3129:3129 --name 3proxy 3proxy.minimal or docker start -i 3proxy

send this to standard input (example):

	chroot run 65535 65535
	nserver 8.8.8.8
	nscache 65535
	log
	proxy -p3129
	end


Use `chroot run 65536 65536` in config for safe chroot environment. `nserver` is required for DNS resolutions in chroot.

Some proxy types (e.g. SOCKSv5 UDPASSCOC, SOCKSv5 BIND functionality, ftp proxy) require access to ephemeral port, you may use e.g. `--network host` mode or `-P` to `docker run`.

`:minimal` without version specified uses current stable version.

## Disclaimer
It is important to note that the use of this tool for any illegal or unauthorized activities is strictly prohibited. The creators of this tool and BlackArch Linux will not be held liable for any actions taken with its use. This tool is intended for use by security professionals and researchers for lawful and ethical testing purposes only. Remember, always obtain proper authorization and comply with all relevant laws and regulations when using this tool or any other security tool.
