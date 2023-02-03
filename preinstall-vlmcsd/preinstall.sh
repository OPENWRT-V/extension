#!/bin/bash

log="/usr/preinstall/vlmcsd/run.log"
ipk1="/usr/preinstall/vlmcsd/vlmcsd.ipk"
ipk2="/usr/preinstall/vlmcsd/luci-app-vlmcsd.ipk"
conf="/usr/preinstall/vlmcsd/vlmcsd.conf"

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

echo "[$(now)] Configure $ipk2" >> $log
newline
cp -rf $conf /etc/config/vlmcsd >> $log 2>&1

divider

echo "[$(now)] Restart Server" >> $log
newline
/etc/init.d/vlmcsd restart >> $log 2>&1

divider

echo "[$(now)] Finished" >> $log
