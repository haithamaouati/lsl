#!/data/data/com.termux/files/usr/bin/bash

PREFIX="/data/data/com.termux/files/usr"
BIN_DIR="$PREFIX/bin"
SCRIPT_NAME="lsl"
TARGET_SCRIPT="$BIN_DIR/$SCRIPT_NAME"

if [ ! -f "$TARGET_SCRIPT" ]; then
    echo "lsl is not installed"
    exit 0
fi

rm -f "$TARGET_SCRIPT"

echo "removed: $TARGET_SCRIPT"
