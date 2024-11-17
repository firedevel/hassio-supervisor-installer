# hassio-supervisor-installer
在任何Debian及其分支上安装Hass.io Supervisor  
Script for installing Hass.io Supervisor on any Debian and its derivatives  

理论上适用于所有架构，但只测试了`armv7l`可用  
Theoretically applicable to all architectures, but only tested to be available on `armv7l`

脚本将安装（更新）`Docker、os-agent`与以下包  
The script will install(update) `Docker、os-agent` and  
```
apparmor bluez cifs-utils curl dbus jq libglib2.0-bin lsb-release network-manager nfs-common systemd-journal-remote systemd-resolved udisks2 wget
```
