#!/bin/sh

echo "uci-debug" >> /dev/kmsg
bash -c "source /usr/extension/base/library.sh && execJob base setup" >> /dev/kmsg
