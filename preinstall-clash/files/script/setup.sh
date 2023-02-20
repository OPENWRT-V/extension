#!/bin/bash

function installIpk() {
    execCmd "opkg install $dataDir/luci-app-openclash.ipk"
}

function start() {
    execTask "install ipk"
}
