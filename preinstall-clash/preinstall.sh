#!/bin/bash

logPath="/usr/preinstall/clash/run.log"
ipkPath="/usr/preinstall/clash/luci-app-openclash.ipk"

echo "Start at $(date +'%Y-%m-%d %H:%M:%S')" > $logPath
echo "------------------------------------------" >> $logPath

echo "Install $ipkPath" >> $logPath
opkg install $ipkPath 2>&1 >> $logPath
echo "------------------------------------------" >> $logPath

echo "Ends at $(date +'%Y-%m-%d %H:%M:%S')" >> $logPath
