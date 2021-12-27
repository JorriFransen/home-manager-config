#!/bin/sh

TARGET_SYS="msi_laptop"
SYS_CONFIG_PATH="./systems/$TARGET_SYS.nix"
REBUILD_COMMAND="switch"

if [ ! -f "$SYS_CONFIG_PATH" ]; then
    echo "Did not find specified system config '$SYS_CONFIG_PATH'"
    exit 1
fi
