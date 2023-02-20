#!/bin/bash

function configureHostname() {
    execCmd "uci set system.@system[0].hostname='router'"
}

function configureTimezone() {
    execCmd "uci set system.@system[0].zonename='Asia/Shanghai'"
    execCmd "uci set system.@system[0].timezone='CST-8'"
}

function applyConfigurations() {
    execCmd "uci commit system"
    execCmd "/etc/init.d/system restart"
}

function start() {
    execTask "configure hostname"
    execTask "configure timezone"
    execTask "apply configurations"
}
