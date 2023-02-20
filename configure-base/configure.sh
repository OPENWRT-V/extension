#!/bin/bash

log="/usr/configure/base/run.log"

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

echo "[$(now)] Configure TimeZone " > $log
uci set system.@system[0].zonename='Asia/Shanghai' > $log
uci set system.@system[0].timezone='CST-8' > $log
uci commit system > $log
/etc/init.d/system restart > $log

divider

echo "[$(now)] Finished" >> $log
