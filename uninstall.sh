#!/data/data/com.termux/files/usr/bin/bash

SCRIPT_NAME="layout"
INSTALL_DIR="$PREFIX/bin"
SCRIPT_PATH="$INSTALL_DIR/$SCRIPT_NAME"

# Function to show errors
die() {
    echo "Error: $1" >&2
    exit 1
}

# Check if the script exists
if [ ! -f "$SCRIPT_PATH" ]; then
    die "'$SCRIPT_NAME' is not installed in $INSTALL_DIR."
fi

# Remove the script
rm "$SCRIPT_PATH" || die "Failed to remove '$SCRIPT_PATH'."

echo "'$SCRIPT_NAME' has been uninstalled from $INSTALL_DIR."
