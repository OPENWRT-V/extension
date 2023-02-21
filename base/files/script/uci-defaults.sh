#!/bin/bash

echo "uci-debug" >> /dev/kmsg
source /usr/extension/base/library.sh >> /dev/kmsg 2>&1
execJob "base" "setup" >> /dev/kmsg 2>&1
