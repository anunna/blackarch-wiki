# BlackArch Mirroring

## Donating a mirror
You are welcome to provide a mirror for BlackArch Linux in your region.

### Requirements

##### Storage: 
The Repo size is aproximitely 80GB and fast growing. You should have at least 2-3 times the size of the distribution in storage, so a minimum of 160-240 GB of storage is recommended.

##### Network Bandwidth: 
A high-speed internet connection with a minimum of 1 Gbps is recommended, to accommodate the fast growth of the distribution and serve packages to a large number of users. You may get away with less bandwidth if you are in a region with many mirrors.

##### CPU and Memory: 
A server with at least 8 GB of RAM and a quad-core processor is recommended to handle the demands of serving packages to multiple clients efficiently.

##### Operating System: 
Arch Linux is recommended. You can use other Operating Systems such as Ubuntu or CentOS to host an Arch Linux mirror, but it is not the recommended approach. Arch Linux is optimized for its own packages and dependencies, and using a different operating system may result in compatibility issues and could lead to inaccuracies in the mirror.

However, if you have a specific reason for using a different Operating System, e.g. Ubuntu or CentOS, you can still set up an Arch Linux mirror on these operating systems by following the general steps for setting up a Linux mirror, such as downloading the required packages, configuring the web server, synchronizing the mirror, and updating the mirror list.

It's important to keep in mind that using a different operating system may require additional configuration and troubleshooting to ensure the mirror is accurate and up-to-date. If possible, it's recommended to use Arch Linux as the operating system for an Arch Linux mirror.

##### Backup: 
We recommend that regular backups of the mirror should be taken to ensure that you can restore the mirror in the event of a failure or data loss. Consider using a backup system that can take snapshots of the mirror at regular intervals.

##### Monitoring and Performance Optimization: 
Regular monitoring of the mirror is important to ensure that it remains fast and reliable. Performance optimization techniques, such as using a CDN, caching, and compression, can help improve the mirror's performance.

## Setup
The following rsync command should be sufficient:
```
rsync -avzzl --delete [...] $site:/blackarch/. /wherever/you/want/to/sync/to/.
```
##### A breakdown of the commands used:
`-a`: Archive mode, which preserves file permissions, timestamps, and other attributes.

`-v`: Verbose mode, which displays detailed information about the synchronization process.

`-zz`: Enables compression during data transfer to reduce bandwidth usage.

`-l`: Copies symlinks as symlinks instead of copying the files they point to.

`--delete`: This option instructs rsync to delete any files or directories in the destination that do not exist in the source. It ensures that the destination is an exact mirror of the source.

`[...]`: This represents the source files and directories you want to synchronize. You would replace [...] with the actual paths of the files and directories you wish to sync.

`$site:/blackarch/.`: This specifies the remote destination where the files will be synchronized. $site is a placeholder for the remote server's hostname or IP address. Any link from [mirrors](https://blackarch.org/downloads.html#mirror-list) can be used.

The following mirrors are recommended
```
rsync://blackarch.unixpeople.org/blackarch/
rsync://ftp.halifax.rwth-aachen.de/blackarch/
rsync://rsync.mirrorservice.org/blackarch.org/blackarch/
```
**NOTE: It is NOT recommended to sync the main site `rsync://blackarch.org/blackarch/`**

/blackarch/ is the directory on the remote server where the files will be synced.

`wherever/you/want/to/sync/to/.`: This represents the local destination directory where the files will be synchronized. You would replace /wherever/you/want/to/sync/to/ with the actual path of the local directory where you want the files to be synced.


To use this command, you would replace `$site` with the actual hostname or IP address of the remote server, and `[...]` with the source files and directories you want to sync.
```
rsync -avzzl --delete /path/to/local/files/ user@example.com:/home/remoteuser/destination/.
```
