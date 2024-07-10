#!/bin/bash

if [[ -d "$DEVKITARM/bin/" ]]; then
    OBJDUMP_BIN="$DEVKITARM/bin/arm-none-eabi-objdump"
else
    OBJDUMP_BIN="arm-none-eabi-objdump"
fi

OBJDUMP="$OBJDUMP_BIN -D -bbinary -marmv4t -Mforce-thumb"

if [ $(($1)) -ge $((0x2018000)) ]; then
    OPTIONS="--adjust-vma=0x2018000 --start-address=$(($1)) --stop-address=$(($2))"
else
    OPTIONS="--start-address=$(($1)) --stop-address=$(($2))"
fi

$OBJDUMP $OPTIONS payload.bin > baserom.dump
$OBJDUMP $OPTIONS payload.gba > payload.dump
colordiff -u baserom.dump payload.dump
