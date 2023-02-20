#!/bin/bash

function installIpk() {
    execCmd "opkg install $dataDir/vlmcsd.ipk"
    execCmd "opkg install $dataDir/luci-app-vlmcsd.ipk"
}

function configure() {
    local hostname="$(uci get system.@system[0].hostname)"
    echoAndCheckValues "hostname"

    execCmd "uci set vlmcsd.config.enabled='1'"
    execCmd "uci set vlmcsd.config.autoactivate='1'"
    execCmd "uci commit vlmcsd"
    execCmd "sed -i '/srv-host=_vlmcs._tcp.lan/d' /etc/dnsmasq.conf"
    execCmd "echo srv-host=_vlmcs._tcp.lan,$hostname.lan,1688,0,100 >> /etc/dnsmasq.conf"
    execCmd "/etc/init.d/vlmcsd enable"
    execCmd "/etc/init.d/vlmcsd start"
    execCmd "/etc/init.d/dnsmasq restart"
}

function start() {
    execTask "install ipk"
    execTask "configure"
}
