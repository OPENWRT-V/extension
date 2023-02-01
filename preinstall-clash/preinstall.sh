#!/bin/bash

logPath="/usr/preinstall/clash/run.log"
ipkPath="/usr/preinstall/clash/luci-app-openclash.ipk"

function now() {
    echo $(date +'%Y-%m-%d %H:%M:%S')
}

function newline() {
    echo "" >> $logPath
}

function divider() {
    newline
    echo "----------------------------------------------------------------------------------------" >> $logPath
    newline
}

echo "[$(now)] Start" > $logPath

divider

echo "[$(now)] Install $ipkPath" >> $logPath
newline
opkg install $ipkPath 2>&1 >> $logPath

divider

echo "[$(now)] Finished" >> $logPath
