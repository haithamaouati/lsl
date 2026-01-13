#!/data/data/com.termux/files/usr/bin/bash

set -e

PREFIX="/data/data/com.termux/files/usr"
BIN_DIR="$PREFIX/bin"
SCRIPT_NAME="lsl"
SOURCE_SCRIPT="./lsl.sh"
TARGET_SCRIPT="$BIN_DIR/$SCRIPT_NAME"

die() {
    echo "install error: $1" >&2
    exit 1
}

[ -f "$SOURCE_SCRIPT" ] || die "lsl.sh not found in current directory"
[ -d "$BIN_DIR" ] || die "bin directory not found: $BIN_DIR"

cp "$SOURCE_SCRIPT" "$TARGET_SCRIPT"
chmod +x "$TARGET_SCRIPT"

echo "installed: $TARGET_SCRIPT"
echo "restart your shell or run 'hash -r' if needed"
