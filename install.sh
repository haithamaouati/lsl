#!/data/data/com.termux/files/usr/bin/bash

# Termux installer for lsl script
SCRIPT_NAME="lsl"
INSTALL_DIR="$PREFIX/bin"
SCRIPT_PATH="$(realpath "$0")"

# Function to show errors
die() {
    echo "Error: $1" >&2
    exit 1
}

# Check if lsl script exists in current directory
if [ ! -f "$SCRIPT_NAME" ]; then
    die "$SCRIPT_NAME not found in current directory."
fi

# Ensure install directory exists
mkdir -p "$INSTALL_DIR" || die "Cannot create $INSTALL_DIR"

# Copy script to install directory
cp "$SCRIPT_NAME" "$INSTALL_DIR/" || die "Failed to copy script."

# Make it executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME" || die "Failed to set executable permission."

echo "Installed '$SCRIPT_NAME' to $INSTALL_DIR"
echo "You can now run it using: $SCRIPT_NAME"
