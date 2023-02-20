#!/bin/bash

function installIpk() {
    execCmd "opkg install $dataDir/luci-theme-argon.ipk"
    execCmd "opkg install $dataDir/luci-app-argon-config.ipk"
}

function start() {
    execTask "install ipk"
}
