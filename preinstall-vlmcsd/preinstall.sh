#!/bin/bash

log="/usr/preinstall/vlmcsd/run.log"
ipk1="/usr/preinstall/vlmcsd/vlmcsd.ipk"
ipk2="/usr/preinstall/vlmcsd/luci-app-vlmcsd.ipk"

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

echo "[$(now)] Install $ipk1" >> $log
newline
opkg install $ipk1 2>&1 >> $log

divider

echo "[$(now)] Install $ipk2" >> $log
newline
opkg install $ipk2 2>&1 >> $log

divider

echo "[$(now)] Finished" >> $log
