#!/bin/bash

log="/usr/preinstall/clash/run.log"
ipk="/usr/preinstall/clash/luci-app-openclash.ipk"

function now() {
    echo $(date +'%Y-%m-%d %H:%M:%S')
}

function newline() {
    echo "" >> $log
}

function divider() {
    newline
    echo "----------------------------------------------------------------------------------------" >> $log
    newline
}

echo "[$(now)] Start" > $log

divider

echo "[$(now)] Install $ipk" >> $log
newline
opkg install $ipk >> $log 2>&1

divider

echo "[$(now)] Finished" >> $log
