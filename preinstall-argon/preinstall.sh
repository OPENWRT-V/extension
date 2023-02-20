#!/bin/bash

log="/usr/preinstall/argon/run.log"
ipk1="/usr/preinstall/argon/luci-theme-argon.ipk"
ipk2="/usr/preinstall/argon/luci-app-argon-config.ipk"

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
opkg install $ipk1 >> $log 2>&1

divider

echo "[$(now)] Install $ipk2" >> $log
newline
opkg install $ipk2 >> $log 2>&1

divider

echo "[$(now)] Finished" >> $log
